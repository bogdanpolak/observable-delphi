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
    procedure TestDeleteObservers;
    // -------------
    procedure TestChanged_InitialNotChanged;
    procedure TestChanged_SetChanged;
    procedure TestChanged_SetAndClearChanged;
    // -------------
    procedure TestNotify_OneObserver;
    procedure TestNotify_NotNotifedWithoutSetChanged;
  end;

implementation

// ------------------------------------------------------------------------
// TBaseObserver class
// ------------------------------------------------------------------------
{$REGION 'TBaseObserver implementation'}

type
  TBaseObserver = class(TInterfacedObject, IObserver)
  strict private
    FIsUpdated: boolean;
  public
    procedure update(AObservable: TObservable; AObject: TObject);
    function IsUpdated: boolean;
  end;

function TBaseObserver.IsUpdated: boolean;
begin
  Result := FIsUpdated;
end;

procedure TBaseObserver.update(AObservable: TObservable; AObject: TObject);
begin
  FIsUpdated := True;
end;

{$ENDREGION}
// ------------------------------------------------------------------------
// Setup and TearDown
// ------------------------------------------------------------------------
{$REGION 'Setup and tear down'}

procedure TObervableTests.Setup;
begin
  FObservable := TObservable.Create;
end;

procedure TObervableTests.TearDown;
begin
  FreeAndNil(FObservable);
end;

{$ENDREGION}
// ------------------------------------------------------------------------
// Basic tests
// ------------------------------------------------------------------------
{$REGION 'Basic tests'}

procedure TObervableTests.TestCountZero;
begin
  Assert.AreEqual(0, FObservable.countObservers);
end;

procedure TObervableTests.TestAddObserver_One;
begin
  FObservable.addObserver(TBaseObserver.Create);
  Assert.AreEqual(1, FObservable.countObservers);
end;

procedure TObervableTests.TestAddObserver_Two;
begin
  FObservable.addObserver(TBaseObserver.Create);
  FObservable.addObserver(TBaseObserver.Create);
  Assert.AreEqual(2, FObservable.countObservers);
end;

procedure TObervableTests.TestDeleteObserver_Add2_Delete1;
var
  o1: IObserver;
begin
  o1 := TBaseObserver.Create;
  FObservable.addObserver(o1);
  FObservable.addObserver(TBaseObserver.Create);
  FObservable.deleteObserver(o1);
  Assert.AreEqual(1, FObservable.countObservers);
end;

procedure TObervableTests.TestDeleteObservers;
begin
  FObservable.addObserver(TBaseObserver.Create);
  FObservable.addObserver(TBaseObserver.Create);
  FObservable.deleteObservers;
  Assert.AreEqual(0, FObservable.countObservers);
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
  FObservable.setChanged;
  FObservable.clearChanged;
  Assert.IsFalse(FObservable.hasChanged);
end;

{$ENDREGION}
// ------------------------------------------------------------------------
// Tests NotifyObservers
// ------------------------------------------------------------------------
{$REGION 'Tests NotifyObservers'}

procedure TObervableTests.TestNotify_OneObserver;
var
  o1: TBaseObserver;
begin
  o1 := TBaseObserver.Create;
  FObservable.addObserver(o1);
  FObservable.setChanged;
  FObservable.notifyObservers;
  Assert.IsTrue(o1.IsUpdated);
end;

procedure TObervableTests.TestNotify_NotNotifedWithoutSetChanged;
var
  o1: TBaseObserver;
begin
  o1 := TBaseObserver.Create;
  FObservable.addObserver(o1);
  FObservable.notifyObservers;
  Assert.IsFalse(o1.IsUpdated);
end;

{$ENDREGION}
// ------------------------------------------------------------------------

initialization

TDUnitX.RegisterTestFixture(TObervableTests);

end.
