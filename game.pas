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
j, angkaDadu : integer;
begin
    for j := 0 to jmlhPemain - 1 do
        begin
            writeln('Pemain ke-',j+1);
            angkaDadu := lemparDadu;
            skorPemain[j] += angkaDadu;
            writeln('Dadu anda bernilai ',angkaDadu);
            writeln('Skor anda saat ini: ',skorPemain[j]);
            readkey;
        end;
end;

//prosedur mencari selisih

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
    for i := 0 to jmlhPemain - 1 do
        begin
            skorPemain[i] := 0;
            write('Nama pemain ke-',i+1,' : ');
            readln(namaPemain[i]);
        end;

    //memanggil prosedur bermain dan akumulasi skor
    i := 1;
    while(i <= 3) do
        begin
            bermain(jmlhPemain);
            i += 1;
        end;

    //memanggil prosedur mencari selisih skor pemain dan skor target

    //memanggil prosedur mencari pemenang dan tampilkan pemenang

    //cek ada tie breaker atau engga
        //jika ada
            //memanggil prosedur untuk game tie breaker dan tampilkan pemenang setelah tie breaker

        //jika tidak
            //end

end.
