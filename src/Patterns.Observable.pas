unit Patterns.Observable;

interface

uses
  System.Generics.Collections;

type
  TObservable = class;

  IObserver = interface
    procedure update (AObservable: TObservable;  AObject: TObject);
  end;

  TObservable = class
  strict private
    FObservers: TArray<IObserver>;
    procedure _addObserverToArray(o: IObserver);
    function _findObserverInArray(o: IObserver): integer;
    procedure _deleteObserverFromArray(o: IObserver);
  private
    FIsChanged: Boolean;
  public
    /// <summary>
    /// Indicates that this object has no longer changed, or that it has
    /// already notified all of its observers of its most recent change,
    /// so that the hasChanged method will now return false.
    /// </summary>
    // clearChanged was protected
    procedure clearChanged();
    /// <summary>
    /// Marks this Observable object as having been changed; the hasChanged
    /// method will now return true.
    /// </summary>
    // setChangedChanged was protected
    procedure setChanged();
    /// <summary>
    /// Adds an observer to the set of observers for this object, provided
    /// that it is not the same as some observer already in the set.
    /// </summary>
    procedure addObserver(o: IObserver);
    /// <summary>
    /// Returns the number of observers of this Observable object.
    /// </summary>
    function countObservers(): integer;
    /// <summary>
    /// Deletes an observer from the set of observers of this object.
    /// </summary>
    procedure deleteObserver(o: IObserver);
    /// <summary>
    /// Clears the observer list so that this object no longer has any observers.
    /// </summary>
    procedure deleteObservers();
    /// <summary>
    /// Tests if this object has changed.
    /// </summary>
    function hasChanged(): Boolean;
    /// <summary>
    /// If this object has changed, as indicated by the hasChanged method,
    /// then notify all of its observers and then call the clearChanged
    /// method to indicate that this object has no longer changed.
    /// </summary>
    procedure notifyObservers(); overload;
    /// <summary>
    /// If this object has changed, as indicated by the hasChanged method,
    // then notify all of its observers and then call the clearChanged method
    // to indicate that this object has no longer changed.
    /// </summary>
    procedure notifyObservers(arg: TObject); overload;
  end;

implementation

uses
  System.SysUtils;

{ Observable }

procedure TObservable.addObserver(o: IObserver);
begin
  _addObserverToArray(o);
end;

procedure TObservable._addObserverToArray(o: IObserver);
begin
  SetLength(FObservers, Length(FObservers) + 1);
  FObservers[High(FObservers)] := o;
end;

procedure TObservable.clearChanged;
begin
  FIsChanged := False;
end;

function TObservable.countObservers: integer;
begin
  Result := Length(FObservers);
end;

procedure TObservable.deleteObserver(o: IObserver);
begin
  _deleteObserverFromArray(o);
end;

procedure TObservable._deleteObserverFromArray(o: IObserver);
var
  idx: integer;
  j: integer;
begin
  idx := _findObserverInArray(o);
  if idx < 0 then
    raise ERangeError.Create('Error Message')
  else
  begin
    for j := idx + 1 to High(FObservers) do
      FObservers[j - 1] := FObservers[j];
    SetLength(FObservers, Length(FObservers) - 1);
  end;
end;

procedure TObservable.deleteObservers;
begin
  SetLength(FObservers, 0);
end;

function TObservable._findObserverInArray(o: IObserver): integer;
begin
  for Result := 0 to High(FObservers) do
    exit;
  Result := -1;
end;

function TObservable.hasChanged: Boolean;
begin
  Result := FIsChanged;
end;

procedure TObservable.notifyObservers(arg: TObject);
begin

end;

procedure TObservable.notifyObservers;
begin

end;

procedure TObservable.setChanged;
begin
  FIsChanged := true;
end;

end.
