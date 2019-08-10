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
    o2: TObserver;
    FObservable: TObservable;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
  published
    // -------------
    procedure TestCountZero;
    procedure TestAddObserver_One;
    procedure TestAddObserver_Two;
    procedure TestDeleteObserver_Add2_Delete1;
    // -------------
    procedure TestChanged_InitialNotChanged;
    procedure TestChanged_SetChanged;
    procedure TestChanged_SetAndClearChanged;
  end;

implementation

// ------------------------------------------------------------------------
// Setup and TearDown
// ------------------------------------------------------------------------
{$REGION 'Setup and tear down'}

procedure TObervableTests.Setup;
begin
  o1 := TObserver.Create;
  o2 := TObserver.Create;
  FObservable := TObservable.Create;
end;

procedure TObervableTests.TearDown;
begin
  FreeAndNil(FObservable);
  FreeAndNil(o1);
  FreeAndNil(o2);
end;

{$ENDREGION}
// ------------------------------------------------------------------------
// Basic tests
// ------------------------------------------------------------------------
{$REGION 'Basic tests'}

procedure TObervableTests.TestCountZero;
begin
  Assert.AreEqual(0,FObservable.countObservers);
end;

procedure TObervableTests.TestDeleteObserver_Add2_Delete1;
begin
  FObservable.addObserver(o1);
  FObservable.addObserver(o2);
  FObservable.deleteObserver(o1);
  Assert.AreEqual(1,FObservable.countObservers);
end;

procedure TObervableTests.TestAddObserver_One;
begin
  FObservable.addObserver(o1);
  Assert.AreEqual(1,FObservable.countObservers);
end;

procedure TObervableTests.TestAddObserver_Two;
begin
  FObservable.addObserver(o1);
  FObservable.addObserver(o2);
  Assert.AreEqual(2,FObservable.countObservers);
end;

{$ENDREGION}
// ------------------------------------------------------------------------
// Tests Changed
// ------------------------------------------------------------------------
{$REGION 'Tests Changed'}

procedure TObervableTests.TestChanged_InitialNotChanged;
begin
  Assert.IsFalse(FObservable.hasChanged);
end;

procedure TObervableTests.TestChanged_SetChanged;
begin
  FObservable.setChanged;
  Assert.IsTrue(FObservable.hasChanged);
end;

procedure TObervableTests.TestChanged_SetAndClearChanged;
begin

end;

{$ENDREGION}
// ------------------------------------------------------------------------

initialization

TDUnitX.RegisterTestFixture(TObervableTests);

end.
