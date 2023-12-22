from flask import Flask, jsonify, request
import cv2
import json
import re
import numpy as np
import pytesseract
from PIL import Image
import os

class KTPOCR(object):
    @staticmethod
    def process_image(image_path):
        img = cv2.imread(image_path)
        gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

        # (2) Threshold
        th, threshed = cv2.threshold(gray, 127, 255, cv2.THRESH_TRUNC)

        # (3) Detect
        result = pytesseract.image_to_string(threshed, lang="ind")

        #menginisisasi variabel
        name = ""
        address = ""
        agama = ""
        kecamatan = ""
        nik = ""
        ttl = ""
        jenis_kelamin = ""
        status_perkawinan = ""
        pekerjaan = ""
        kewarganegaraan = ""
        berlaku_hingga = ""
        

        # (5) Extract only name and address
        for word in result.split("\n"):
            if "Nama" in word:
                name = word.split("Nama")[-1].strip().replace(": ", "")
            elif "Alamat" in word:
                address = word.split("Alamat")[-1].strip().replace(": ", "")
            elif "Agama" in word:
                agama = word.split("Agama")[-1].strip().replace(": ", "").replace("|", "")
            elif "Kecamatan" in word:
                kecamatan = word.split("Kecamatan")[-1].strip().replace(": ", "")
            elif "NIK" in word:
                nik = word.split("NIK")[-1].strip().replace(": ", "")
            elif "Tempat/Tgl Lahir" in word:
                ttl = word.split("Tempat/Tgl Lahir")[-1].strip().replace(": ", "")
            elif "Jenis Kelamin" in word:
                jenis_kelamin = word.split("Jenis Kelamin")[-1].strip().replace(": ", "")  
            elif "Status Perkawinan" in word:
                status_perkawinan = word.split("Status Perkawinan")[-1].strip().replace(": ", "")
            elif "Pekerjaan" in word:
                pekerjaan = word.split("Pekerjaan")[-1].strip().replace(": ", "")
            elif "Kewarganegaraan" in word:
                kewarganegaraan = word.split("Kewarganegaraan")[-1].strip().replace(": ", "")
            elif "Berlaku Hingga" in word:
                berlaku_hingga = word.split("Berlaku Hingga")[-1].strip().replace(": ", "")
          
                
                
        return name, address, agama, kecamatan, nik, ttl, jenis_kelamin, status_perkawinan, pekerjaan, kewarganegaraan, berlaku_hingga
    # ttl, jenis_kelamin, status_perkawinan, pekerjaan, kewarganegaraan,berlaku_hingga