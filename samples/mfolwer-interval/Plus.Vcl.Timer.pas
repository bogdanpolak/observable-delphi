unit Plus.Vcl.Timer;

interface

uses
  System.Classes,
  System.SysUtils,
  Vcl.ExtCtrls;

type
  // --------------------------------------------------------------------
  // TStoper
  // * method Reset()
  // * method  IfPassThenReset (TimeToPassMs): boolean;
  // * property EnlapsedMs: Integer
  // --------------------------------------------------------------------
  TStoper = class(TComponent)
  private
    FStartTick: Cardinal;
    function GetEnlapsedMs: Integer;
  published
    constructor Create(AOwner: TComponent); override;
    procedure Reset;
    function IfPassThenReset (TimeToPassMs: Integer): boolean;
    property EnlapsedMs: Integer read GetEnlapsedMs;
  end;

  // --------------------------------------------------------------------
  // TPlusTimer
  // * class method Run(Owner, Interval, OnTimerProc);
  // * class method RunOnce(Owner, DelayMs, OnTimerProc);
  // -- old way of using:
  // * property Enabled: boolean
  // * property Interval: Integer
  // * event OnTimer: TProc
  // --------------------------------------------------------------------
  TTimerMode = (tmDefault, tmOnce, tmRepeat);

  TPlusTimer = class(TComponent)
  private
    FOnTimer: System.SysUtils.TProc;
    FTimerMode: TTimerMode;
    FTimer: Vcl.ExtCtrls.TTimer;
    FInterval: Integer;
    FEnabled: boolean;
    procedure OnTimerEvent(Sender: TObject);
    procedure StartNewTimer;
    procedure SetInterval(const Value: Integer);
    procedure SetEnabled(const Value: boolean);
  public
    constructor Create(Owner: TComponent); override;
    property Enabled: boolean read FEnabled write SetEnabled;
    property OnTimer: TProc read FOnTimer write FOnTimer;
    property Interval: Integer read FInterval write SetInterval;
    class procedure Run(AOwner: TComponent; aInterval: Integer;
      aOnTimerProc: TProc);
    class procedure RunOnce(AOwner: TComponent; aDelayMs: Integer;
      aOnTimerProc: TProc);
  end;

implementation

uses
  WinAPI.Windows;

// ----------------------------------------------------------------------
// TStoper
// ----------------------------------------------------------------------

constructor TStoper.Create(AOwner: TComponent);
begin
  inherited;

end;

procedure TStoper.Reset;
begin
  FStartTick := WinAPI.Windows.GetTickCount;
end;

function TStoper.GetEnlapsedMs: Integer;
begin
  Result := abs(WinAPI.Windows.GetTickCount - FStartTick);
end;


function TStoper.IfPassThenReset(TimeToPassMs: Integer): boolean;
begin
  Result := EnlapsedMs>TimeToPassMs;
  if Result then
    Reset;
end;

// ----------------------------------------------------------------------
// TPlusTimer
// ----------------------------------------------------------------------

constructor TPlusTimer.Create(Owner: TComponent);
begin
  inherited;
  FTimer := TTimer.Create(Self);
  FTimer.OnTimer := OnTimerEvent;
end;

procedure TPlusTimer.OnTimerEvent(Sender: TObject);
begin
  if Assigned(FOnTimer) then
    FOnTimer();
  if (FTimerMode = tmOnce) then
  begin
    FTimer.Enabled := False;
    FTimer.Free;
    FTimer := nil;
  end;
end;

procedure TPlusTimer.StartNewTimer;
begin
  if (Interval > 0) and Assigned(OnTimer) then
  begin
    FTimer := TTimer.Create(Self);
    FTimer.OnTimer := OnTimerEvent;
    if FTimerMode = tmDefault then
      FTimerMode := tmRepeat;
  end;
end;

procedure TPlusTimer.SetEnabled(const Value: boolean);
begin
  if FTimer = nil then
    StartNewTimer;
  FEnabled := Value;
end;

procedure TPlusTimer.SetInterval(const Value: Integer);
begin
  if FTimer = nil then
    StartNewTimer;
  FInterval := Value;
  FTimer.Enabled := False;
  FTimer.Interval := Value;
  FTimer.Enabled := True;
end;

class procedure TPlusTimer.RunOnce(AOwner: TComponent; aDelayMs: Integer;
  aOnTimerProc: TProc);
begin
  with TPlusTimer.Create(AOwner) do
  begin
    FTimerMode := tmOnce;
    OnTimer := aOnTimerProc;
    Interval := aDelayMs;
  end;
  // TODO: Component should be destroyed (risk of memory leaks)
  // Owner will destroy the component, but it is still dangerous
  // Temporarily Can add a guard (Owner<>nil)
end;

class procedure TPlusTimer.Run(AOwner: TComponent; aInterval: Integer;
  aOnTimerProc: TProc);
begin
  with TPlusTimer.Create(AOwner) do
  begin
    FTimerMode := tmRepeat;
    OnTimer := aOnTimerProc;
    Interval := aInterval;
  end;
  // TODO: Component should be destroyed (as above)
end;

end.
