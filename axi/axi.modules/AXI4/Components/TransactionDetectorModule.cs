using Quokka.RTL;
using RTL.Modules;

namespace rtl.modules
{
    public class TransactionDetectorModuleInputs
    {
        public bool iTXBegin;
        public bool iTXEnd;
        public bool iRestart;
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

        public bool oTransaction => State.Status == eTransactionStatus.Active;
        public bool oWaitForRestart => State.Status == eTransactionStatus.WaitForRestart;

        protected override void OnStage()
        {
            switch (State.Status)
            {
                case eTransactionStatus.Ready:
                    if (Inputs.iTXBegin)
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
