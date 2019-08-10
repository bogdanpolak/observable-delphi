unit Patterns.Observable;

interface

type
  Observer = class

  end;

  Observable = class
  protected
    // Indicates that this object has no longer changed, or that it has already notified all of its observers of its most recent change, so that the hasChanged method will now return false.
    procedure clearChanged();
    // Marks this Observable object as having been changed; the hasChanged method will now return true.
    procedure setChanged();
  public
    /// <summary>
    /// Adds an observer to the set of observers for this object, provided
    /// that it is not the same as some observer already in the set.
    /// </summary>
    procedure addObserver(o: Observer);
    /// <summary>
    /// Returns the number of observers of this Observable object.
    /// </summary>
    function countObservers(): integer;
    /// <summary>
    /// Deletes an observer from the set of observers of this object.
    /// </summary>
    procedure deleteObserver(o: Observer);
    /// <summary>
    /// Clears the observer list so that this object no longer has any observers.
    /// </summary>
    procedure deleteObservers();
    /// <summary>
    ///   Tests if this object has changed.
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

{ Observable }

procedure Observable.addObserver(o: Observer);
begin

end;

procedure Observable.clearChanged;
begin

end;

function Observable.countObservers: integer;
begin

end;

procedure Observable.deleteObserver(o: Observer);
begin

end;

procedure Observable.deleteObservers;
begin

end;

function Observable.hasChanged: boolean;
begin

end;

procedure Observable.notifyObservers(arg: TObject);
begin

end;

procedure Observable.notifyObservers;
begin

end;

procedure Observable.setChanged;
begin

end;

end.
