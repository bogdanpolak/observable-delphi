unit Form.Interval;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    LabelExampleInfo: TLabel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edtStartField: TEdit;
    Label2: TLabel;
    edtEndField: TEdit;
    Label3: TLabel;
    edtLengthField: TEdit;
    procedure edtStartFieldExit(Sender: TObject);
    procedure edtEndFieldExit(Sender: TObject);
    procedure edtLengthFieldExit(Sender: TObject);
  private
    procedure calculateEnd;
    procedure calculateLength;
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

function isNotInteger(const s: String): boolean;
var
  i: Integer;
begin
  Result := not TryStrToInt(s, i);
end;

procedure TForm1.calculateEnd;
var
  _start: Integer;
  _length: Integer;
  _end: Integer;
begin
  _start := Integer_parseInt(edtStartField.Text);
  _length := Integer_parseInt(edtLengthField.Text);
  _end := _start + _length;
  edtEndField.Text := _end.ToString;
end;

procedure TForm1.calculateLength;
var
  _start: Integer;
  _end: Integer;
  _length: Integer;
begin
  _start := Integer_parseInt(edtStartField.Text);
  _end := Integer_parseInt(edtEndField.Text);
  _length := _end - _start;
  edtLengthField.Text := _length.ToString;
end;

procedure TForm1.edtStartFieldExit(Sender: TObject);
begin
  if isNotInteger(edtStartField.Text) then
    edtStartField.Text := '0';
  calculateLength();
end;

procedure TForm1.edtEndFieldExit(Sender: TObject);
begin
  if isNotInteger(edtEndField.Text) then
    edtEndField.Text := '0';
  calculateLength();
end;

procedure TForm1.edtLengthFieldExit(Sender: TObject);
begin
  if isNotInteger(edtLengthField.Text) then
    edtLengthField.Text := '0';
  calculateEnd();
end;

end.
