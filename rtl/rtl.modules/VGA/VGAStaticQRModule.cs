using Quokka.Public.Tools;
using Quokka.RTL;
using System;
using System.Drawing;
using System.IO;
using System.Linq;

namespace RTL.Modules
{
    public class VGAStaticQRModuleInputs
    {
    }

    public class VGAStaticQRModuleState
    {
        public bool Visible;
        public bool HSync;
        public bool VSync;
        public byte[] QR;
        public byte Pixels;
        public RTLBitArray PixelAddress;
    }

    public class VGAStaticQRModule : RTLSynchronousModule<VGAStaticQRModuleInputs, VGAStaticQRModuleState>
    {
        VGAController vgaController = new VGAController();
        private readonly int ramBits;
        public VGAStaticQRModule(RuntimeConfiguration runtimeConfiguration)
        {
            ramBits = (int)(vgaController.addrBits - 2);
            var compressedQR = new byte[1 << ramBits];
            
            var compressedQRIndex = 0;
            var qrPath = Path.Combine(runtimeConfiguration?.SourceLocation, @"VGA\Resources\VGAStaticQRModule.png");
            if (!File.Exists(qrPath))
                throw new FileNotFoundException($"Static QR file was not found: {qrPath}");

            var content = File.ReadAllBytes(qrPath);
            using (var pngStream = new MemoryStream(content))
            using (var image = new Bitmap(pngStream))
            {
                for (var row = 0; row < image.Height; row++)
                {
                    int compressedPixels = 0;
                    for (var col = 0; col < image.Width; col++)
                    {
                        var compressedPixelIndex = (col % 4) * 2;
                        var pixel = image.GetPixel(col, row);

                        switch ((uint)pixel.ToArgb() & 0xFFFFFF)
                        {
                            case 0xFFFFFF:
                                // replace white with black
                                break;
                            case 0xFF0000:
                                compressedPixels |= 1 << compressedPixelIndex;
                                break;
                            case 0x0000FF:
                                compressedPixels |= 3 << compressedPixelIndex;
                                break;
                            default:
                                // all others default to green
                                compressedPixels |= 2 << compressedPixelIndex;
                                break;
                        }

                        if ((col + 1) % 4 == 0)
                        {
                            compressedQR[compressedQRIndex] |= (byte)compressedPixels;
                            compressedQRIndex++;
                            compressedPixels = 0;
                        }
                    }
                }
            }

            InitState(new VGAStaticQRModuleState()
            {
                QR = compressedQR,
                PixelAddress = new RTLBitArray().Resized(vgaController.addrBits)
            });
        }

        RTLBitArray pixelAddress => State.PixelAddress[1, 0];
        RTLBitArray pixelBits => (new RTLBitArray(State.Pixels) >> (2 * pixelAddress))[1, 0];
        
        public bool R => State.Visible & pixelBits == 1;
        public bool G => State.Visible & pixelBits == 2;
        public bool B => State.Visible & pixelBits == 3;
        
        public bool OutVisible => State.Visible;
        public bool VSync => State.VSync;
        public bool HSync => State.HSync;

        protected override void OnSchedule(Func<VGAStaticQRModuleInputs> inputsFactory)
        {
            base.OnSchedule(inputsFactory);
            vgaController.Schedule(() => new VGAControllerInputs());
        }

        protected override void OnStage()
        {
            NextState.Pixels = State.QR[vgaController.OutPixelAddress >> 2];
            NextState.PixelAddress = vgaController.OutPixelAddress;
            NextState.Visible = vgaController.OutVisible;
            NextState.HSync = vgaController.HSync;
            NextState.VSync = vgaController.VSync;
        }
    }
}
