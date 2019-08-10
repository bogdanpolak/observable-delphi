unit Patterns.Observable;

interface

uses
  System.Generics.Collections;

type
  TObserver = class

  end;

  TObservable = class
  strict private
    FObservers: TArray<TObserver>;
    procedure AddObserverToArray(o: TObserver);
    function FindObserverInArray(o: TObserver): integer;
    procedure DeleteObserverFromArray(o: TObserver);
  protected
    /// <summary>
    /// Indicates that this object has no longer changed, or that it has
    /// already notified all of its observers of its most recent change,
    /// so that the hasChanged method will now return false.
    /// </summary>
    procedure clearChanged();
    /// <summary>
    /// Marks this Observable object as having been changed; the hasChanged
    /// method will now return true.
    /// </summary>
    procedure setChanged();
  public
    /// <summary>
    /// Adds an observer to the set of observers for this object, provided
    /// that it is not the same as some observer already in the set.
    /// </summary>
    procedure addObserver(o: TObserver);
    /// <summary>
    /// Returns the number of observers of this Observable object.
    /// </summary>
    function countObservers(): integer;
    /// <summary>
    /// Deletes an observer from the set of observers of this object.
    /// </summary>
    procedure deleteObserver(o: TObserver);
    /// <summary>
    /// Clears the observer list so that this object no longer has any observers.
    /// </summary>
    procedure deleteObservers();
    /// <summary>
    /// Tests if this object has changed.
    /// </summary>
    function hasChanged(): boolean;
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

procedure TObservable.addObserver(o: TObserver);
begin
  AddObserverToArray(o);
end;

procedure TObservable.AddObserverToArray(o: TObserver);
begin
  SetLength(FObservers, Length(FObservers) + 1);
  FObservers[High(FObservers)] := o;
end;

procedure TObservable.clearChanged;
begin

end;

function TObservable.countObservers: integer;
begin
  Result := Length(FObservers);
end;

procedure TObservable.deleteObserver(o: TObserver);
begin
  DeleteObserverFromArray(o);
end;

procedure TObservable.DeleteObserverFromArray(o: TObserver);
var
  idx: integer;
  j: integer;
begin
  idx := FindObserverInArray(o);
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

end;

function TObservable.FindObserverInArray(o: TObserver): integer;
begin
  for Result := 0 to High(FObservers) do
    exit;
  Result := -1;
end;

function TObservable.hasChanged: boolean;
begin
  Result := False;
end;

procedure TObservable.notifyObservers(arg: TObject);
begin

end;

procedure TObservable.notifyObservers;
begin

end;

procedure TObservable.setChanged;
begin

end;

end.
