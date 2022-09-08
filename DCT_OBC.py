import numpy as np
import math as m
from fxpmath import Fxp
def cos_fun(i):
    return np.cos(i*np.pi/(2*N))
file="/home/tharunsai/Documents/Verilog/DSP_A/"
N=16
coeff0=[cos_fun(8)]
coeff1=[cos_fun(1),cos_fun(3),cos_fun(5),cos_fun(7),cos_fun(9),cos_fun(11),cos_fun(13),cos_fun(15)]
coeff2=[cos_fun(2),cos_fun(6),cos_fun(10),cos_fun(14)]
coeff3=[-cos_fun(1),cos_fun(3),-cos_fun(5),-cos_fun(7),cos_fun(9),-cos_fun(11),-cos_fun(13),cos_fun(15)]
coeff4=[cos_fun(4),cos_fun(12)]
coeff5=[cos_fun(1),-cos_fun(3),cos_fun(5),-cos_fun(7),cos_fun(9),cos_fun(11),-cos_fun(13),cos_fun(15)]
coeff6=[-cos_fun(2),cos_fun(6),-cos_fun(10),-cos_fun(14)]
coeff7=[cos_fun(1),-cos_fun(3),-cos_fun(5),cos_fun(7),-cos_fun(9),-cos_fun(11),cos_fun(13),cos_fun(15)]
coeff8=[cos_fun(8)]
coeff9=[cos_fun(1),-cos_fun(3),-cos_fun(5),cos_fun(7),cos_fun(9),cos_fun(11),-cos_fun(13),-cos_fun(15)]
coeff10=[cos_fun(2),cos_fun(6),cos_fun(10),cos_fun(14)]
coeff11=[-cos_fun(1),-cos_fun(3),-cos_fun(5),cos_fun(7),cos_fun(9),cos_fun(11),cos_fun(13),cos_fun(15)]
coeff12=[cos_fun(4),cos_fun(12)]
coeff13=[cos_fun(1),cos_fun(3),-cos_fun(5),-cos_fun(7),-cos_fun(9),cos_fun(11),cos_fun(13),cos_fun(15)]
coeff14=[cos_fun(2),cos_fun(6),cos_fun(10),cos_fun(14)]
coeff15=[-cos_fun(1),cos_fun(3),-cos_fun(5),cos_fun(7),-cos_fun(9),cos_fun(11),-cos_fun(13),cos_fun(15)]
coeff=[coeff0,coeff1,coeff2,coeff3,coeff4,coeff5,coeff6,coeff7,coeff8,coeff9,coeff10,coeff11,coeff12,coeff13,coeff14,coeff15]
def gen_fixd(arr,N):
    res=[]
    for i in arr:
        x=Fxp(i,dtype='S1.'+str(N-1))
        res.append(x.bin())
    return res
def coeff_gen(num,bits,coeff):
    res=0
    for i in range(0,bits):
        res=res+coeff[i]*(-1 if num&1 else 1)
        num=num>>1
    return -res/2
def gen_ROM(arr,N_bits):
    iter=2**N_bits
    res=[]
    for i in range(0,iter>>1):
        res.append(coeff_gen(i,N_bits,arr)/16)
    return res
def to_file(name,arr,s=''):
    r=file+name+".txt"
    f=open(r,"w")
    for i in arr:
        x=Fxp(i,dtype='S1.31')
        f.write(s+x.bin()+"\n")
    f.close()
def gen_inputs(name,arr,s=''):
    r=file+name+".txt"
    j=0
    f=open(r,"w")
    for i in arr:
        x=Fxp(i,dtype='S1.31')
        f.write(s+str(j)+"=32'b"+x.bin()+';'+"\n")
        j=j+1
    f.close()
def gen_file():
    f="X"
    x=0
    for i in coeff:
        res=gen_ROM(i,len(i))
        to_file(f+str(x),res)
        x=x+1       
def to_decimal(arr,shift):
    a=list(map(int,arr))
    a=a[shift:len(a)]+shift*[0]
    res=-1*a[0]
    for i in range(1,len(arr)):
        res=res+a[i]*(2**(-i))
    return res
def fixd_decimal(arr,N):
    temp=[]
    res=[]
    for i in arr:
        temp[0:]=i
        res.append(to_decimal(temp,0))
    return res
def outputs(name,N,shift):
    r=file+name+".txt"
    f=open(r,"r+")
    res=f.readlines()
    w=[]
    out=[]
    for i in res:
        w[0:]=i
        out.append(to_decimal(w[0:N],shift));
    return out
def e(k):
    if(k==0):
        return 2**(-0.5)
    else:
        return 1
def dct(x):
    X=[]
    print(len(x))
    for k in range(0,len(x)):
        s=0
        for n in range(0,len(x)):
            s=s+x[n]*e(k)*cos_fun((2*n+1)*k)
        X.append(s)
    return X       
        
