program IntervalSample;

uses
  Vcl.Forms,
  Form.Interval in 'Form.Interval.pas' {Form1},
  Patterns.Observable in '..\..\src\Patterns.Observable.pas',
  Interval in 'Interval.pas',
  Plus.Vcl.Timer in 'Plus.Vcl.Timer.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
