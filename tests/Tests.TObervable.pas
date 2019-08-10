unit Tests.TObervable;

interface

uses
  DUnitX.TestFramework,
  System.Classes, System.SysUtils;

{$M+}

type
  [TestFixture]
  TObervableTests = class(TObject)
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
  published
    // -------------
    procedure Test1;
  end;

implementation

// ------------------------------------------------------------------------
// Setup and TearDown
// ------------------------------------------------------------------------
{$REGION 'Registered issues (bugs)'}

procedure TObervableTests.Setup;
begin
end;

procedure TObervableTests.TearDown;
begin
end;

{$ENDREGION}
// ------------------------------------------------------------------------
// Test 1
// ------------------------------------------------------------------------
{$REGION 'Registered issues (bugs)'}

procedure TObervableTests.Test1;
begin

end;

initialization
  TDUnitX.RegisterTestFixture(TObervableTests);
end.
