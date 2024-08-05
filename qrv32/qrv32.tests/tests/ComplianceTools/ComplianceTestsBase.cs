namespace QRV32.ComplianceTools
{
    public class ComplianceTestsBase
    {
        IComplianceTestsBaseAdapter _adapter;

        public ComplianceTestsBase(IComplianceTestsBaseAdapter adapter)
        {
            _adapter = adapter;
        }

        protected virtual void RunAndAssert(string testName) => _adapter.RunAndAssert(testName);
        protected virtual void Run(string testName) => _adapter.RunPlain(testName);
    }
}
