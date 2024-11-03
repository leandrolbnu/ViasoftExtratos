program Viasoft;

uses
  Vcl.Forms,
  ViasoftExtratos in 'ViasoftExtratos.pas' {Form1},
  ViasoftController in 'Controller\ViasoftController.pas',
  ViasoftModel in 'Model\ViasoftModel.pas',
  Transacao in 'Record\Transacao.pas',
  ViasoftControllerInterface in 'Interface\ViasoftControllerInterface.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
