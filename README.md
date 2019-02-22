# praktikum1
Soal Shift Modul 1 Sistem Operasi 2019

Soal1.</br>
Anda diminta tolong oleh teman anda untuk mengembalikan filenya yang telah dienkripsi oleh seseorang menggunakan bash script, file yang dimaksud adalah nature.zip. Karena terlalu mudah kalian memberikan syarat akan membuka seluruh file tersebut jika pukul 14:14 pada tanggal 14 Februari atau hari tersebut adalah hari jumat pada bulan Februari.</br>
Jawaban:</br>
* Download file nature.zip, ekstrak di home
* Create <file>.sh pada folder nature dengan sintaks berikut enter  
```
#!/bin/bash
i=1
for pict in /home/nanda/nature/*.jpg
do
  base64 -d "$pict" | xxd -r > "/home/nanda/nature/pict"$i".jpg"
  let i++
done
```
 </br>Hasil
![alt text](https://raw.githubusercontent.com/mmanurung/praktikum1/master/Cuplikan%20layar%20dari%202019-02-22%2011-05-33.png)
![alt text](https://raw.githubusercontent.com/mmanurung/praktikum1/master/Cuplikan%20layar%20dari%202019-02-22%2010-43-34.png)
![alt text](https://raw.githubusercontent.com/mmanurung/praktikum1/master/Cuplikan%20layar%20dari%202019-02-22%2011-02-25.png)
</br>
Penjelasan</br>
  1. `for pict in /home/nanda/nature/*.jpg ` Semua gambar di folder nature akan masuk ke dalam for loop
  2. `base64 -d` Mendecrypt semua "pict" yang sudah ditentukan di for loop tadi.
  3. Hasil decrypt nya masuk ke perintah `xxd -r` untuk di reverse hexdump
  4. `"/home/nanda/nature/pict"$i".jpg"` Hasil jadinya disimpan di folder nature dengan mengganti nama menjadi "pict<i>n</i>.jpg" n=1,2,3,..  
* Untuk crontab, ketik `crontab -e`  
  1. `14 14 14 2 5 /bin/bash /home/nanda/nature/soal1.sh` ketikkan pada baris terakhir crontab
  2. Lalu ketikkan `crontab -l` untuk memastikan perubahan yang disimpan
  </br></br></br>
Soal2.</br>
Anda merupakan pegawai magang pada sebuah perusahaan retail, dan anda diminta untuk memberikan laporan berdasarkan file WA_Sales_Products_2012-14.csv. Laporan yang diminta berupa:</br>
a.) Tentukan negara dengan penjualan(quantity) terbanyak pada tahun 2012.</br>
`awk -F, '$7=="2012" && maximum<$10 {maximum=$1} END {print maximum}' WA_Sales_Products_2012-14.csv`</br>
</br>Penjelasan</br>
`'$7=="2012" && maximum<$10 {maximum=$1}`
Dapatkan nilai terbesar pada kolom Quantity yang pada kolom Year-nya adalah 2012. Hasil dari nilai terbesar disimpan di "maximum" dan actionnya ialah mengambil negara yang bersesuaian dengan selection_criteria tadi.</br>
![alt text](https://raw.githubusercontent.com/mmanurung/praktikum1/master/Cuplikan%20layar%20dari%202019-02-22%2010-55-25.png)
</br>
b.) Tentukan tiga product line yang memberikan penjualan(quantity) terbanyak pada soal poin a.</br>
`awk -F , '$1=="United States" && $7==2012 {i[$4]+=$10} END {for(x in i) print i[x], x}' WA_Sales_Products_2012-14.csv | sort -nr  | head -3 | awk '{print $2,$3}'`
</br>Penjelasan</br>
`'$1=="United States" && $7==2012 {i[$4]+=$10}'`
Selection_criterianya ialah kolom dengan negara "United States" (dari jawaban a) dan terjadi ditahun 2012. Action yang diambil ialah menghitung quantity tiap product line.</br>
`sort -nr  | head -3 | awk '{print $2,$3}'` Urutkan dari besar ke kecil, lalu ambil 3 terbesar, dan ditampilkan di output.</br>
![alt text](https://raw.githubusercontent.com/mmanurung/praktikum1/master/Cuplikan%20layar%20dari%202019-02-22%2010-56-02.png)
</br>
c.) Tentukan tiga product yang memberikan penjualan(quantity) terbanyak berdasarkan tiga product line yang didapatkan pada soal poin b.</br>
`awk -F , '$1=="United States" && $7==2012 && ($4 == "Personal Accessories" || $4 == "Camping Equipment" || $4 == "Outdoor Protection") {i[$6]+=$10} END  {for(x in i) print i[x], x}' WA_Sales_Products_2012-14.csv | sort -nr  | head -3 | awk '{print $2,$3}'`
</br>Penjelasan</br>
`$1=="United States" && $7==2012 && ($4 == "Personal Accessories" || $4 == "Camping Equipment" || $4 == "Outdoor Protection") {i[$6]+=$10}`
Sama dengan soal b, tapi ditambah criteria dari jawaban soal b. Action yang diambil adalah mendapatkan quantity masing-masing product.</br>
`sort -nr  | head -3` Urutkan dari besar ke kecil, lalu ambil 3 terbesar, dan ditampilkan di output.</br>
![alt text](https://raw.githubusercontent.com/mmanurung/praktikum1/master/Cuplikan%20layar%20dari%202019-02-22%2010-56-52.png)
</br>
