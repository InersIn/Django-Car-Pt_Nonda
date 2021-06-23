# Django-Web-Car-PT_Nonda
Tugas Akhir Basis Data Lanjutan
| Nama |  Nim  |
|:-----|:--------:|
| Kadek Dwi Wardana Saputra   | 1901020028 |
| Apolonarius abriando sinaga djawa tao   |  1901020043  |
| Kadek Satya Wageswara   | 1901020039 |

# Instalation
Cloning dari github
```bash
git clone https://github.com/InersIn/Django-Web-Car-PT_Nonda.git
```
Membuat python virtual environment pada Linux
```bash
vistualvenv .env
```
Menggunakan Virtual Environment yang telah dibuat
```bash
source .env/bin/activate
```
Installing requirements
```bash
pip install -r requirements.txt
```

Rename beberapa file (IMPORTANT)
```bash
mv .env/lib/python3.9/site-packages/fontawesome-free .env/lib/python3.9/site-packages/fontawesome_free
```

# Database
Pastikan service MySql sudah berjalan dan nama database, username, password dan port dari Service MySql sesuai seperti berikut.
```python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'PtNonda',            # Nama Database
        'USER': 'nonda',              # Username Database
        'PASSWORD': 'nonda',          # Password Database
        'HOST': 'localhost',          # Host Database
        'PORT': '3306'                # Port Mysql Service
    }
}
```
Dapat diedit pada ```nonda2/settings.py```

Melakukan Migration pada Django
```bash
python3 manage.py makemigration
```
```bash
python3 manage.py migrate
```
Restore file Database pada folder ```sql_backup``` dan masukan password sesuai seperti pada ```nonda2/settings.py```
```bash
mysql -u nonda -p PtNonda < database.sql
```

Untuk Automatisasi Input Data pada sisi manufactures saya sudah buat agar dapat memasukan data secara random tanpa perlu manual memasukan data, dengan membuka link berikut, dan memasukan jumlah data yang ingin di masukan.
```url
127.0.0.1:8000/dealers/input/$int
```
$int = Jumlah data

# Running
```bash
python3 ./manage.py runserver
```

# Mysql Query

Berikut beberapa Query untuk memenuhi task yang diminta.
#### Data penjualan pada bulan 3
```sql
select * from dealers_transaction where month(DateSell)=3;
```
#### 2 Data penjualan terakhir pada bulan 3
```sql
select * from dealers_transaction where month(DateSell)=3 order by DateBuy DESC limit 2;
```
