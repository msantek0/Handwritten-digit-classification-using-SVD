# Handwritten-digit-classification-using-SVD
Handwritten digit classification using singular value decomposition in matlab.

## Acknowledgments

This was homework on subject [Introduction to complex data search](http://www.pmf.unizg.hr/math/predmet/uuspp_a) at the [Faculty of Science](http://www.pmf.unizg.hr/math) in Zagreb done together with colleague [Zadravec](https://github.com/zadroCK).


## Dataset

In this project we use handwritten digits from the US Postal Service database to test the performance of our algorithm. The digits are represented by gray scale pixel images. Samples are show here: 
![Samples of handwritten digits](/pictures/digits.png)

### azip
In azip are all train samples.
The dimension of each image isn't 16 x 16 matrix rather a vector 256 x 1. 
So when we load all train data in one matrix, the dimensions of that matrix are 256 x _number of samples_, where each colum is one digit 0-9.

### dzip
Is vector of dimensions 1 x _number_of_samples_ where each "colum" is number from 0 to 9 witch tell us what is on image at that colum in azip

## Idea
Algoritam starts with creation of matrix (let's call it B for whatever reason) B of all samples of one digit. The idea is to use [Eckart–Young–Mirsky–Schmidt theorem](https://en.wikipedia.org/wiki/Low-rank_approximation), that is to approximate matrix B by a lower-ranking matrix. Now do that with every digit so we get 10 matrices. When we get new image we just look at projection on this 10 "spaces" and see which one is the closes to new image.

### Determine low rank
 To determine what low rank to choose lets look at singular values of matrix rank 100:
![100 singular values](/pictures/singular_values.png)
Now if we select k (low rank) equal to 41 we will have matrix almost half rank smaller and error of only 10^-5.
We used the same method to determine our k and came up with k = 22.

## Results 
When we run our code on test data with 2007 samples we get accuracy of **93%** 


