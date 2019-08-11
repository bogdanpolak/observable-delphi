unit Form.Interval;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

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
    procedure calculateLenght;
  public
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.calculateEnd;
begin
  // TODO:
  (* Java:
  try {
    int start = Integer.parseInt(_startField.getText());
    int length = Integer.parseInt(_lengthField.getText());
    int end = start + length;
    _endField.setText(String.valueOf(end));
  } catch (NumberFormatException e) {
    throw new RuntimeException ("Unexpected Number Format Error");
  }
  *)
end;

procedure TForm1.calculateLenght;
begin
  // TODO:
  (* Java:
  try {
    int start = Integer.parseInt(_startField.getText());
    int end = Integer.parseInt(_endField.getText());
    int length = end - start;
    _lengthField.setText(String.valueOf(length));
  } catch (NumberFormatException e) {
    throw new RuntimeException ("Unexpected Number Format Error");
  }
  *)
end;

procedure TForm1.edtStartFieldExit(Sender: TObject);
begin
  // TODO:
  (* Java:
   * if (isNotInteger(_startField.getText()))
   *   _startField.setText("0");
   * calculateLength();
   *)
end;

procedure TForm1.edtEndFieldExit(Sender: TObject);
begin
  // TODO:
  (* Java:
   * if (isNotInteger(_endField.getText()))
   *   _endField.setText("0");
   * calculateLength();
   *)
end;

procedure TForm1.edtLengthFieldExit(Sender: TObject);
begin
  // TODO:
  (* Java:
   * if (isNotInteger(_lengthField.getText()))
   *   _lengthField.setText("0");
   * calculateEnd();
   *)
end;

end.
