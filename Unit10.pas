unit Unit10;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, MemDS, DBAccess, MyAccess,
  Vcl.StdCtrls, frxClass, frxDBSet;

type
  TForm1 = class(TForm)
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    MyConnection1: TMyConnection;
    MyQuery1: TMyQuery;
    MyQuery2: TMyQuery;
    MyQuery3: TMyQuery;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    frxDBDataset2: TfrxDBDataset;
    frxDBDataset3: TfrxDBDataset;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var bln : string;
begin
 bln:=ComboBox2.Text+ComboBox1.Text;

 MyQuery1.SQL.Clear;
 MyQuery1.SQL.Add('SELECT no_dana, bulan, no_anggota, jumlah FROM dana WHERE status ='+QuotedStr('lunas')+' AND bulan ='+QuotedStr(bln));
 MyQuery1.Open;

 MyQuery2.SQL.Clear;
 MyQuery2.SQL.Add('SELECT no_dana, bulan, kegiatan, jumlah FROM dana WHERE keterangan ='+QuotedStr('masuk')+' AND bulan ='+QuotedStr(bln));
 MyQuery2.Open;

 MyQuery3.SQL.Clear;
 MyQuery3.SQL.Add('SELECT no_dana, bulan, kegiatan, jumlah FROM dana WHERE keterangan ='+QuotedStr('keluar')+' AND bulan ='+QuotedStr(bln));
 MyQuery3.Open;

 frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+'\cetak.fr3');
 frxReport1.ShowReport();
end;

end.
