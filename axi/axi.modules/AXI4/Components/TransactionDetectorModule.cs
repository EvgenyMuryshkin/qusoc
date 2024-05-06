using Quokka.RTL;

namespace axi.modules
{
    public class TransactionDetectorModuleInputs
    {
        public bool iTXBegin;
        public bool iTXEnd;
        public bool iRestart;
        public bool iActive;
    }

    public enum eTransactionStatus
    {
        Ready,
        Active,
        WaitForRestart
    }

    public class TransactionDetectorModuleState
    {
        public eTransactionStatus Status;
    }

    public class TransactionDetectorModule : RTLSynchronousModule<TransactionDetectorModuleInputs, TransactionDetectorModuleState>
    {
        public TransactionDetectorModule()
        {
        }

        public bool oTXBegin => State.Status == eTransactionStatus.Ready && Inputs.iTXBegin;
        public bool oTransaction => State.Status == eTransactionStatus.Active;
        public bool oWaitForRestart => State.Status == eTransactionStatus.WaitForRestart;

        protected override void OnStage()
        {
            switch (State.Status)
            {
                case eTransactionStatus.Ready:
                    if (Inputs.iTXBegin && Inputs.iActive)
                        NextState.Status = eTransactionStatus.Active;
                    break;
                case eTransactionStatus.Active:
                    if (Inputs.iTXEnd)
                        NextState.Status = eTransactionStatus.WaitForRestart;
                    break;
                case eTransactionStatus.WaitForRestart:
                    if (Inputs.iRestart)
                        NextState.Status = eTransactionStatus.Ready;
                    break;
            }
        }
    }
}
