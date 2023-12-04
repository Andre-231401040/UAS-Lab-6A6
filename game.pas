program gameDadu;

uses crt;

var
jmlhPemain, skorTarget : integer;
skorPemain, selisihSkor : array of integer;
namaPemain : array of string;

//function acak dadu
function lemparDadu:integer;
begin
    randomize;
    lemparDadu := random(5)+1;
end;

//prosedur pemain sedang bermain dan akumulasi skor

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

    //memanggil prosedur bermain dan akumulasi skor masing-masing pemain

    //memanggil prosedur mencari selisih skor pemain dan skor target

    //memanggil prosedur mencari pemenang dan tampilkan pemenang

    //cek ada tie breaker atau engga
        //jika ada
            //memanggil prosedur untuk game tie breaker dan tampilkan pemenang setelah tie breaker

        //jika tidak
            //end
            
end.
