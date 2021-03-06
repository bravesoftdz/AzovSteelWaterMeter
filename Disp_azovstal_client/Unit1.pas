unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, IBDatabase, DB, IBSQL, StdCtrls, IBCustomDataSet,
  IBQuery, ComCtrls, TeEngine, Series, TeeProcs, Chart, DbChart, Mask,
  DBCtrls, Grids, DBGrids;

type
  TForm1 = class(TForm)
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    tm_refresh: TTimer;
    NS3P_500: TIBQuery;
    NS3P_600: TIBQuery;
    NS2P_500: TIBQuery;
    NS2P_600: TIBQuery;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Shape7: TShape;
    Shape8: TShape;
    Shape9: TShape;
    ibq500: TIBQuery;
    ibq600: TIBQuery;
    ibq2p5: TIBQuery;
    ibq2p6: TIBQuery;
    eq3p5: TEdit;
    eq2p5: TEdit;
    eq3p6: TEdit;
    eq2p6: TEdit;
    edq5: TEdit;
    edq6: TEdit;
    NS3P_500_ch: TIBQuery;
    NS3P_600_ch: TIBQuery;
    NS2P_600_ch: TIBQuery;
    NS2P_500_ch: TIBQuery;
    IBTransaction2: TIBTransaction;
    DBChart1: TDBChart;
    Series2: TLineSeries;
    DBChart3: TDBChart;
    LineSeries3: TLineSeries;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    TabSheet4: TTabSheet;
    DBChart2: TDBChart;
    LineSeries2: TLineSeries;
    LineSeries6: TLineSeries;
    DBChart4: TDBChart;
    LineSeries8: TLineSeries;
    e_time_500: TEdit;
    e_interval_500: TEdit;
    Label12: TLabel;
    Label13: TLabel;
    e_time_600: TEdit;
    Label18: TLabel;
    e_interval_600: TEdit;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    lb_warning: TLabel;
    tm_warning: TTimer;
    g500: TIBQuery;
    g600: TIBQuery;
    begin_date_500: TDateTimePicker;
    begin_time_500: TDateTimePicker;
    end_date_500: TDateTimePicker;
    end_time_500: TDateTimePicker;
    Button11: TButton;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    begin_date_600: TDateTimePicker;
    begin_time_600: TDateTimePicker;
    Label22: TLabel;
    end_date_600: TDateTimePicker;
    end_time_600: TDateTimePicker;
    Button12: TButton;
    tm_srv_time: TTimer;
    ibq_srv_time: TIBQuery;
    Label23: TLabel;
    e_srv_time: TEdit;
    Label24: TLabel;
    e_delta_25: TEdit;
    e_delta_35: TEdit;
    Label25: TLabel;
    Label26: TLabel;
    e_delta_5: TEdit;
    Label27: TLabel;
    Label28: TLabel;
    e_delta_26: TEdit;
    e_delta_36: TEdit;
    e_delta_6: TEdit;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    vol500: TIBQuery;
    vol600: TIBQuery;
    TabSheet5: TTabSheet;
    dbg_tab: TDBGrid;
    ds_tab: TDataSource;
    IBTransaction3: TIBTransaction;
    ibq_2p500_tab: TIBQuery;
    btn_2p5: TButton;
    btn_3p5: TButton;
    btn_2p6: TButton;
    btn_3p6: TButton;
    ibq_3p500_tab: TIBQuery;
    ibq_2p600_tab: TIBQuery;
    ibq_3p600_tab: TIBQuery;
    rb_vol_500: TRadioButton;
    rb_pres_500: TRadioButton;
    rb_vol_600: TRadioButton;
    rb_pres_600: TRadioButton;
    Series4: TLineSeries;
    procedure tm_refreshTimer(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure TabSheet4Show(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure tm_warningTimer(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure tm_srv_timeTimer(Sender: TObject);
    procedure btn_2p5Click(Sender: TObject);
    procedure btn_3p5Click(Sender: TObject);
    procedure btn_2p6Click(Sender: TObject);
    procedure btn_3p6Click(Sender: TObject);
    procedure rb_pres_500Click(Sender: TObject);
    procedure rb_pres_600Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  interval_time = record
    interval : Variant;
    time_end : Variant; //TDateTime;
  end;

var
  Form1: TForm1;
  q2p5, q3p5, q2p6, q3p6, dq5, dq6 : real;
  interval : interval_time;
  delta_time_500, delta_time_600, max_time_500, max_time_600,
  dt_begin_500, dt_end_500, dt_begin_600, dt_end_600, Warn_500,
  Warn_600, serv_cur_time: TDateTime;

implementation

uses unit2;

{$R *.dfm}

procedure TForm1.tm_refreshTimer(Sender: TObject);
begin
//NS3P_500.ExecQuery;


IBTransaction1.Active := true;
{
NS3P_500.Active := false;
NS3P_500.Active := true;
NS3P_600.Active := false;
NS3P_600.Active := true;
NS2P_500.Active := false;
NS2P_500.Active := true;
NS2P_600.Active := false;
NS2P_600.Active := true;
}

ibq500.Active := false;
ibq600.Active := false;
ibq500.Active := true;
ibq600.Active := true;

//ibq.Refresh;
{
NS3P_500_TM.Text := DateTimeToStr(NS3P_500.FieldValues['TM']);
NS3P_500_VOL.Text := FLOATToStr(NS3P_500.FieldValues['VOLUME']);
NS3P_500_SP.Text := FLOATToStr(NS3P_500.FieldValues['SPEED']);
NS3P_500_PRES.Text := FLOATToStr(NS3P_500.FieldValues['PRESURE']);

NS3P_600_TM.Text := DateTimeToStr(NS3P_600.FieldValues['TM']);
NS3P_600_VOL.Text := FLOATToStr(NS3P_600.FieldValues['VOLUME']);
NS3P_600_SP.Text := FLOATToStr(NS3P_600.FieldValues['SPEED']);
NS3P_600_PRES.Text := FLOATToStr(NS3P_600.FieldValues['PRESURE']);

NS2P_500_TM.Text := DateTimeToStr(NS2P_500.FieldValues['TM']);
NS2P_500_VOL.Text := FLOATToStr(NS2P_500.FieldValues['VOLUME']);
NS2P_500_SP.Text := FLOATToStr(NS2P_500.FieldValues['SPEED']);


NS2P_600_TM.Text := DateTimeToStr(NS2P_600.FieldValues['TM']);
NS2P_600_VOL.Text := FLOATToStr(NS2P_600.FieldValues['VOLUME']);
NS2P_600_SP.Text := FLOATToStr(NS2P_600.FieldValues['SPEED']);
}

q2p5 := ibq500.FieldValues['SPEED_2'];// ibq500.FieldValues['Q2P5'];
q3p5 := ibq500.FieldValues['SPEED_3'];// ibq500.FieldValues['Q3P5'];
//delta_time_500 := ibq500.FieldValues['delta_time'];
max_time_500 := ibq500.FieldValues['max_time'];


q2p6:= ibq600.FieldValues['SPEED_2'];// ibq600.FieldValues['Q2P6'];
q3p6:= ibq600.FieldValues['SPEED_3'];// ibq600.FieldValues['Q3P6'];
//delta_time_600 := ibq600.FieldValues['delta_time'];
max_time_600 := ibq600.FieldValues['max_time'];


dq5 := q3p5 - q2p5;
dq6 := q3p6 - q2p6;

eq3p5.Text := FLOATToStr(q3p5) + ' �.���./�';
eq2p5.Text := FLOATToStr(q2p5) + ' �.���./�';
eq3p6.Text := FLOATToStr(q3p6) + ' �.���./�';
eq2p6.Text := FLOATToStr(q2p6) + ' �.���./�';

e_time_500.Text := ibq500.FieldValues['max_time'];
e_interval_500.Text := ibq500.FieldValues['delta_time'];
e_time_600.Text := ibq600.FieldValues['max_time'];
e_interval_600.Text := ibq600.FieldValues['delta_time'];

Warn_500 := ibq500.FieldValues['max_time'];
Warn_600 := ibq600.FieldValues['max_time'];

edq5.Text := FLOATToStr(dq5) + ' �.���./�';
edq6.Text := FLOATToStr(dq6) + ' �.���./�';


IBTransaction1.Commit;

end;

procedure TForm1.Label1Click(Sender: TObject);
begin
form2.NS2P_500.Active := true;
form2.Show;
end;

procedure TForm1.Label3Click(Sender: TObject);
begin
form2.NS3P_500.Active := true;
form2.Show;
end;

procedure TForm1.Label2Click(Sender: TObject);
begin
form2.NS2P_600.Active := true;
form2.Show;
end;

procedure TForm1.Label4Click(Sender: TObject);
begin
form2.NS3P_600.Active := true;
form2.Show;
end;

procedure TForm1.TabSheet2Show(Sender: TObject);
begin

IBTransaction2.Active := true;

//NS2P_500_ch.Active := false;
//NS3P_500_ch.Active := false;

g500.Active := false;
//vol500.Active := false;

IBTransaction2.Commit;

//NS2P_500_ch.Params.ParamValues['interval'] := interval;
//NS3P_500_ch.Params.ParamValues['interval'] := interval;

g500.Params.ParamValues['interval'] := interval.interval;
g500.Params.ParamValues['TIME_END'] := interval.time_end;
//vol500.Params.ParamValues['interval'] := interval.interval;
//vol500.Params.ParamValues['TIME_END'] := interval.time_end;


//NS2P_500_ch.Active := true;
//NS3P_500_ch.Active := true;

g500.Active := true;
//vol500.Active := true;

//e_delta_25.Text := vol500.FieldValues['dvol_25'];
//e_delta_35.Text := vol500.FieldValues['dvol_35'];
//e_delta_5.Text :=  vol500.FieldValues['dvol_5'];

g500.Last;

if g500.FieldValues['integr_v_2'] = null then
e_delta_25.Text := '0' else
begin 
e_delta_25.Text := FloatToStr(g500.FieldValues['integr_v_2']);
end;

if g500.FieldValues['integr_v_3'] = null then
e_delta_35.Text := '0' else
begin
e_delta_35.Text := FloatToStr(g500.FieldValues['integr_v_3']);
end;

e_delta_5.Text := floattostr(strtofloat(e_delta_35.Text) - strtofloat(e_delta_25.Text));


end;

procedure TForm1.FormCreate(Sender: TObject);
begin
   tm_refreshTimer(Sender);
   interval.interval := 1;
   interval.time_end := null;
   tm_srv_time.Enabled := true;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
interval.interval := 30;
   interval.time_end := null;
TabSheet2Show(Sender);
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
interval.interval := 365;
   interval.time_end := null;
TabSheet2Show(Sender);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
interval.interval := 7;
   interval.time_end := null;
TabSheet2Show(Sender);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
interval.interval := 1;
   interval.time_end := null;
TabSheet2Show(Sender);
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
interval.interval := 0.041667;
   interval.time_end := null;
TabSheet2Show(Sender);
end;

procedure TForm1.TabSheet4Show(Sender: TObject);
begin

{

IBTransaction2.Active := true;

NS2P_600_ch.Active := false;
NS3P_600_ch.Active := false;


IBTransaction2.Commit;

NS2P_600_ch.Params.ParamValues['interval'] := interval;
NS3P_600_ch.Params.ParamValues['interval'] := interval;


NS2P_600_ch.Active := true;
NS3P_600_ch.Active := true;

}

IBTransaction2.Active := true;

//NS2P_500_ch.Active := false;
//NS3P_500_ch.Active := false;

g600.Active := false;

IBTransaction2.Commit;

//NS2P_500_ch.Params.ParamValues['interval'] := interval;
//NS3P_500_ch.Params.ParamValues['interval'] := interval;

g600.Params.ParamValues['interval'] := interval.interval;
g600.Params.ParamValues['TIME_END'] := interval.time_end;


//NS2P_500_ch.Active := true;
//NS3P_500_ch.Active := true;

g600.Active := true;

g600.Last;

if g600.FieldValues['integr_v_2'] = null then
e_delta_26.Text := '0' else
begin 
e_delta_26.Text := floattostr(g600.FieldValues['integr_v_2']);
end;

if g600.FieldValues['integr_v_3'] = null then
e_delta_36.Text := '0' else
begin
e_delta_36.Text := floattostr(g600.FieldValues['integr_v_3']);
end;

e_delta_6.Text := floattostr(strtofloat(e_delta_36.Text) - strtofloat(e_delta_26.Text));

end;

procedure TForm1.Button6Click(Sender: TObject);
begin
interval.interval := 365;
   interval.time_end := null;
TabSheet4Show(Sender);
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
interval.interval := 30;
   interval.time_end := null;
TabSheet4Show(Sender);
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
interval.interval := 7;
   interval.time_end := null;
TabSheet4Show(Sender);
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
interval.interval := 1;
   interval.time_end := null;
TabSheet4Show(Sender);
end;

procedure TForm1.Button10Click(Sender: TObject);
begin
interval.interval := 0.041667;
   interval.time_end := null;
TabSheet4Show(Sender);
end;

procedure TForm1.tm_warningTimer(Sender: TObject);
begin
if lb_warning.Visible then lb_warning.Visible := false
else lb_warning.Visible := true;
end;

procedure TForm1.Button11Click(Sender: TObject);
begin
dt_begin_500 := trunc(begin_date_500.DateTime) + begin_time_500.DateTime - trunc(begin_time_500.DateTime);
dt_end_500 := trunc(end_date_500.DateTime) + end_time_500.DateTime - trunc(end_time_500.DateTime);
interval.interval :=  dt_end_500 - dt_begin_500;
interval.time_end :=  dt_end_500;
//e_delta_25.Text := g500.FieldValues[]
TabSheet2Show(Sender);
end;

procedure TForm1.Button12Click(Sender: TObject);
begin
dt_begin_600 := trunc(begin_date_600.DateTime) + begin_time_600.DateTime - trunc(begin_time_600.DateTime);
dt_end_600 := trunc(end_date_600.DateTime) + end_time_600.DateTime - trunc(end_time_600.DateTime);
interval.interval :=  dt_end_600 - dt_begin_600;
interval.time_end :=  dt_end_600;
TabSheet4Show(Sender);
end;

procedure TForm1.tm_srv_timeTimer(Sender: TObject);
begin
ibq_srv_time.Active := true;
 serv_cur_time :=  ibq_srv_time.FieldValues['serv_cur_time'];
 e_srv_time.Text := ibq_srv_time.FieldValues['serv_cur_time'];
 ibq_srv_time.Active := false;   


 if ((serv_cur_time - max_time_500) > 0.021) or
    ((serv_cur_time - max_time_600) > 0.021) then tm_warning.Enabled := true;

 if ((serv_cur_time - max_time_500) <= 0.021) and
    ((serv_cur_time - max_time_600) <= 0.021) then
    begin
       tm_warning.Enabled := false;
       lb_warning.Visible := false;
    end;
 
end;

procedure TForm1.btn_2p5Click(Sender: TObject);
begin
ds_tab.DataSet := ibq_2p500_tab;
ibq_2p500_tab.Active := false;
ibq_2p500_tab.Active := true;
end;

procedure TForm1.btn_3p5Click(Sender: TObject);
begin
ds_tab.DataSet := ibq_3p500_tab;
ibq_3p500_tab.Active := false;
ibq_3p500_tab.Active := true;
end;

procedure TForm1.btn_2p6Click(Sender: TObject);
begin
ds_tab.DataSet := ibq_2p600_tab;
ibq_2p600_tab.Active := false;
ibq_2p600_tab.Active := true;
end;

procedure TForm1.btn_3p6Click(Sender: TObject);
begin
ds_tab.DataSet := ibq_3p600_tab;
ibq_3p600_tab.Active := false;
ibq_3p600_tab.Active := true;
end;

procedure TForm1.rb_pres_500Click(Sender: TObject);
begin
if rb_pres_500.Checked then
begin
DBChart1.Visible := false;
DBChart3.Visible := true;
end;
if rb_vol_500.Checked then
begin
DBChart1.Visible := true;
DBChart3.Visible := false;
end;
end;

procedure TForm1.rb_pres_600Click(Sender: TObject);
begin
if rb_pres_600.Checked then
begin
DBChart2.Visible := false;
DBChart4.Visible := true;
end;
if rb_vol_600.Checked then
begin
DBChart2.Visible := true;
DBChart4.Visible := false;
end;
end;

end.
