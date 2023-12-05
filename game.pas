program gameDadu;

uses crt;

var
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
            writeln('Pemain ke-',i+1);
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

//prosedur mengurutkan selisih dari yang terkecil sampai terbesar
procedure sort(jmlhPemain : integer);
var
i, j, temp : integer;
begin
    for i := 0 to jmlhPemain - 2 do
        begin
            for j := i+1 to jmlhPemain - 1 do
                begin
                    if(selisihSkor[j] < selisihSkor[i]) then
                        begin
                            temp := selisihSkor[i];
                            selisihSkor[i] := selisihSkor[j];
                            selisihSkor[j] := temp;
                        end;
                end;
        end;
end;

//prosedur tampilkan pemenang

//prosedur cek ada atau tidaknya tie breaker

//prosedur game tie breaker

begin
    writeln('===========================================');
    writeln('Selamat Datang di Game Dadu Kelompok 6A6!!!');
    writeln('===========================================');
    writeln('NOTE: Pemain maksimal berjumlah 5 orang');
    writeln;
    write('Masukkan jumlah pemain: ');
    readln(jmlhPemain);
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
            bermain(jmlhPemain);
            i += 1;
        end;

    //mencari selisih skor pemain dan skor target
    mencariSelisih(jmlhPemain);

    //mengurutkan selisih dari yang terkecil sampai terbesar
    sort(jmlhPemain);

    //cari pemenang berdasarkan selisih terkecil dan tampilkan pemenang

    //cek ada tie breaker atau engga
        //jika ada
            //memanggil prosedur untuk game tie breaker dan tampilkan pemenang setelah tie breaker

        //jika tidak
            //end

end.
