unit Form.Interval;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Math,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Patterns.Observable, Interval;

type
  TForm1 = class(TForm, IObserver)
    LabelExampleInfo: TLabel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edtStartField: TEdit;
    Label2: TLabel;
    edtEndField: TEdit;
    Label3: TLabel;
    edtLengthField: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure edtStartFieldExit(Sender: TObject);
    procedure edtEndFieldExit(Sender: TObject);
    procedure edtLengthFieldExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FInterval: TInterval;
    procedure update(AObservable: TObservable; AObject: TObject);
  public
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

function Integer_parseInt(const s: String): Integer;
begin
  Result := StrToInt(s);
end;

function IsInteger(const s: String): boolean;
var
  i: Integer;
begin
  Result := TryStrToInt(s, i);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FInterval := TInterval.Create;
  with FInterval do
  begin
    MinValue := 1;
    MaxValue := 8;
  end;
  FInterval.addObserver(Self);
  update(FInterval, nil);
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FInterval.Free;
end;

procedure TForm1.update(AObservable: TObservable; AObject: TObject);
begin
  edtStartField.Text := FInterval.MinValue.ToString;
  edtEndField.Text := FInterval.MaxValue.ToString;
  edtLengthField.Text := FInterval.Length.ToString;
end;

procedure TForm1.edtStartFieldExit(Sender: TObject);
begin
  FInterval.MinValue := IfThen(IsInteger(edtStartField.Text),
    Integer_parseInt(edtStartField.Text), 0);
end;

procedure TForm1.edtEndFieldExit(Sender: TObject);
begin
  FInterval.MaxValue := IfThen(IsInteger(edtEndField.Text),
    Integer_parseInt(edtEndField.Text), 0);
end;

procedure TForm1.edtLengthFieldExit(Sender: TObject);
begin
  FInterval.Length := IfThen(IsInteger(edtLengthField.Text),
    Integer_parseInt(edtLengthField.Text), 0);
end;

end.
