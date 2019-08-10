unit Tests.TObervable;

interface

uses
  DUnitX.TestFramework,
  System.Classes, System.SysUtils,
  Patterns.Observable;

{$M+}

type

  [TestFixture]
  TObervableTests = class(TObject)
  private
    o1: TObserver;
    FObservable: TObservable;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
  published
    // -------------
    procedure TestAddObserver_One;
  end;

implementation

// ------------------------------------------------------------------------
// Setup and TearDown
// ------------------------------------------------------------------------
{$REGION 'Setup and tear down'}

procedure TObervableTests.Setup;
begin
  o1 := TObserver.Create;
  FObservable := TObservable.Create;
end;

procedure TObervableTests.TearDown;
begin
  FreeAndNil(FObservable);
  FreeAndNil(o1);
end;

{$ENDREGION}
// ------------------------------------------------------------------------
// Basic tests
// ------------------------------------------------------------------------
{$REGION 'Basic tests'}

procedure TObervableTests.TestAddObserver_One;
begin
  FObservable.addObserver(o1);
  Assert.AreEqual(1,FObservable.countObservers);
end;

{$ENDREGION}

initialization

TDUnitX.RegisterTestFixture(TObervableTests);

end.
