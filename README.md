# Soft-Acoustic-Curvature-sensor
This research focuses on design and development of a Soft Acoustic Curvature (SAC) sensor. An AI model has been developed to establish the correlation between sound amplitude and the curvature of the sensor. An acoustic channel was considered inside the soft structure affected by bending.

<p align="center" >
<img src="https://github.com/hgolshanian/Soft-Acoustic-Curvature-SAC-sensor/blob/main/Photos/Capture6.PNG" width=450 height=300>
<p align="center" >
Figure1. Soft Acoustic Curvature
 
We have Prepared dataset using known curvatures and 1000 samples and then Trained different Machine Learning models. 
<p align="center" >
<img src="https://github.com/hgolshanian/Soft-Acoustic-Curvature-SAC-sensor/blob/main/Photos/Capture5.PNG" width=450 height=300>
<p align="center" >
Figure2. Curvature test objects ranging from 0 to 60 m-1 and Variation of the recorded amplitude with curvature for each frequency
 
To select the appropriate Machine Learning model the validation error played a crucial role. According to Figure3 Rational quadratic Gaussian process regression model showed the best performance. 
<p align="center" >
<img src="https://github.com/hgolshanian/Soft-Acoustic-Curvature-SAC-sensor/blob/main/Photos/Capture4.PNG" width=450 height=300>
<p align="center" >
Figure3. Comparison of the regression models

To assess the accuracy of the proposed curvature measurement method, we subjected the sensor to validation tests using rigid test objects of known curvatures. The results indicate that while the sensor’s errors are relatively large (~<3 m-1) at smaller curvatures (curvature < 10 m-1), the sensor performs well for curvatures exceeding 10 m-1, with errors reduced to ~<1 m-1.

<p align="center" >
<img src="https://github.com/hgolshanian/Soft-Acoustic-Curvature-SAC-sensor/blob/main/Photos/Capture7.PNG" width=450 height=200>
<p align="center" >
Figure4. Measurement results

