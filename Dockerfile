# Wybierz obraz bazowy Pythona 3.11.1
FROM python:3.11.1

# Ustaw katalog roboczy wewnątrz kontenera na /app
WORKDIR /app

# Skopiuj wszystkie pliki aplikacji do katalogu roboczego w kontenerze
COPY . /app

# Zaktualizuj pip
RUN pip install --upgrade pip

# Zainstaluj wymagane pakiety
RUN pip install --no-cache-dir pandas numpy tensorflow matplotlib scikit-learn keras kafka-python

# Zdefiniuj polecenie, które zostanie uruchomione podczas uruchamiania kontenera
CMD ["python", "./Test1.py"]
