program IntervalSample;

uses
  Vcl.Forms,
  Form.Interval in 'Form.Interval.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
