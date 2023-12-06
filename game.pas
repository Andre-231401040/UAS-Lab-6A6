program gameDadu;

uses crt;

label awal;

var
jawaban : char;
i, jmlhPemain, skorTarget : integer;
skorPemain, selisihSkor : array of integer;
namaPemain : array of string;

//function acak dadu
function lemparDadu:integer;
begin
    randomize;
    lemparDadu := random(5)+1;
end;

//prosedur bermain dan akumulasi skor
procedure bermain(jmlhPemain : integer);
var
i, angkaDadu : integer;
begin
    for i := 0 to jmlhPemain - 1 do
        begin
            writeln('Pemain ke-',i+1,' atau ',namaPemain[i]);
            angkaDadu := lemparDadu;
            skorPemain[i] += angkaDadu;
            writeln('Dadu anda bernilai ',angkaDadu);
            writeln('Skor anda saat ini: ',skorPemain[i]);
            readkey;
            writeln;
        end;
end;

//prosedur mencari selisih
procedure mencariSelisih(jmlhPemain : integer);
var
i : integer;
begin
    for i:= 0 to jmlhPemain -1 do
        begin
            if(skorPemain[i] <= skorTarget) then
                begin
                    selisihSkor[i] := skorTarget - skorPemain[i];
                end
            else
                begin
                    selisihSkor[i] := skorPemain[i] - skorTarget;
                end;
        end;
end;

//prosedur mengurutkan selisih dari yang terkecil sampai terbesar dan ranking pemain
procedure sort(jmlhPemain : integer);
var
i, j, temp1,temp3 : integer;
temp2 : string;
begin
    for i := 0 to jmlhPemain - 2 do
        begin
            for j := i+1 to jmlhPemain - 1 do
                begin
                    if(selisihSkor[j] < selisihSkor[i]) then
                        begin
                            temp1 := selisihSkor[i];
                            selisihSkor[i] := selisihSkor[j];
                            selisihSkor[j] := temp1;
                            temp2 := namaPemain[i];
                            namaPemain[i] := namaPemain[j];
                            namaPemain[j] := temp2;
                            temp3 := skorPemain[i];
                            skorPemain[i] := skorPemain[j];
                            skorPemain[j] := temp3;
                        end;
                end;
        end;
end;

//prosedur tampilkan pemenang
procedure tampilkanPemenang(jmlhPemain : integer);
var
i : integer;
begin
    for i := 0 to jmlhPemain - 1 do 
        begin
            gotoXY(1,i+5);writeln(i+1);
            gotoXY(9,i+5);writeln('|');
            gotoXY(11,i+5);writeln(namaPemain[i]);
            gotoXY(30,i+5);writeln('|');
            gotoXY(32,i+5);writeln(skorPemain[i]);
            gotoXY(37,i+5);writeln('|');
            gotoXY(39,i+5);writeln(selisihSkor[i]);
        end;
end;

begin
    awal:
    clrscr;
    writeln('===========================================');
    writeln('Selamat Datang di Game Dadu Kelompok 6A6!!!');
    writeln('===========================================');
    writeln('NOTE: Pemain maksimal berjumlah 5 orang');
    writeln;
    write('Masukkan jumlah pemain: ');
    readln(jmlhPemain);
    if(jmlhPemain > 5) then
        begin
            writeln('Jumlah pemain yang anda masukkan lebih banyak dari ketentuan');
            readln;
            goto awal;
        end
    else if(jmlhPemain < 2) then
        begin
            writeln('Jumlah pemain yang dimasukkan minimal 2 orang');
            readln;
            goto awal;
        end;
    write('Masukkan skor target: ');
    readln(skorTarget);
    //menentukan ukuran array berdasarkan jumlah pemain
    setlength(namaPemain, jmlhPemain);
    setlength(skorPemain, jmlhPemain);
    setlength(selisihSkor, jmlhPemain);

    //tambah nama pemain
    writeln;
    for i := 0 to jmlhPemain - 1 do
        begin
            skorPemain[i] := 0;
            write('Nama pemain ke-',i+1,' : ');
            readln(namaPemain[i]);
        end;

    clrscr;
    //bermain dan akumulasi skor
    i := 1;
    while(i <= 3) do
        begin
            clrscr;
            writeln('Putaran ke-',i);
            bermain(jmlhPemain);
            i += 1;
        end;

    //mencari selisih skor pemain dan skor target
    mencariSelisih(jmlhPemain);

    //mengurutkan selisih dari yang terkecil sampai terbesar dan ranking pemain
    sort(jmlhPemain);

    //cari pemenang berdasarkan selisih terkecil dan tampilkan pemenang
    clrscr;
    writeln('Skor Target : ', skorTarget); 
    writeln('===================================================');
    gotoXY(1,3);writeln('Ranking');
    gotoXY(9,3);writeln('|');
    gotoXY(11,3);writeln('Nama');
    gotoXY(30,3);writeln('|');
    gotoXY(32,3);writeln('Skor');
    gotoXY(37,3);writeln('|');
    gotoXY(39,3);writeln('SelisihSkor');
    writeln('===================================================');
    tampilkanPemenang(jmlhPemain);

    //bertanya kepada user apakah ingin mengulang atau tidak
    write('Apakah ingin lanjut bermain (Y/T): ');
    readln(jawaban);

    jawaban := upcase(jawaban);

    if(jawaban = 'Y') then
        begin
            goto awal;
        end;
    writeln('TERIMA KASIH SUDAH MENCOBA GAME KAMI!!!');
end.
