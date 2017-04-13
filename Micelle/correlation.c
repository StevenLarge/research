#include <stdio.h>
#include <math.h>
#include <stdlib.h>

int main(){

	char dummy[100], output[100], input1[100], input2[100];
	
	FILE *fp;
	
	double *data_array1;
	double *data_array2;
	double *corr;
	double *corracc;
	
	double *acc_c;
	
	double accumulator;
	
	int start_time, end_time, tau_time, tau_reduced, temp, data_tot;
	
	double val, avg1, avg2, normalize, d1, d2;
	
	int j,k,n,acc;
																	//Read in the input parameters from correlation_input
	fp = fopen("correlation_input","r");
	
	fscanf(fp,"%s\n", dummy);
	
	fscanf(fp,"%s %s\n", dummy, input1);
	fscanf(fp,"%s %s\n", dummy, input2);
	
	fscanf(fp,"%s %d\n", dummy, &start_time);
	fscanf(fp,"%s %d\n", dummy, &end_time);
	
	fscanf(fp,"%s %d\n", dummy, &tau_time);
	
	fscanf(fp,"%s %s\n", dummy, output);
	
	fclose(fp);
																	//Define the total number of data points to be obtained
	data_tot = end_time - start_time;
	
	data_array1 = (double *)malloc(sizeof(double)*data_tot);		//Allocate memory
	data_array2 = (double *)malloc(sizeof(double)*data_tot);
	corracc = (double *)malloc(sizeof(double)*tau_time);
	corr = (double *)malloc(sizeof(double)*tau_time);
	acc_c = (double *)malloc(sizeof(double)*tau_time);
			
	for(k = 0 ; k < data_tot ; k++){								//Zero arrays
		data_array1[k] = 0.0;
		data_array2[k] = 0.0;
	}
	for(k = 0 ; k < tau_time ; k++){
		corracc[k] = 0.0;
		corr[k] = 0.0;
	}
	
	fp = fopen(input1,"r");											//Read in the data from input_1

	accumulator = 0.0;
	acc = 0;
	
		for(k = 0 ; k < end_time ; k++){
			fscanf(fp,"%d\t%lf\n", &temp, &val);
				if(k >= start_time){								//Only collect data past the start time
					data_array1[k-start_time] = val;
					accumulator += val;					
					acc += 1;
				}
		}
	fclose(fp);
		
	avg1 = accumulator/(double)acc;									//Calculate the average value of data set 1
	
	accumulator = 0.0;
	acc = 0;
		
	fp = fopen(input2,"r");											//Read in the data from input_2
		for(k = 0 ; k < end_time ; k++){
			fscanf(fp,"%d\t%lf\n", &temp, &val);
				if(k >= start_time){								//Only collect data past the start time
					data_array2[k-start_time] = val;
					accumulator += val;
					acc += 1;
				}
		}
	fclose(fp);
	
	avg2 = accumulator/(double)acc;									//Calculate the average value of data set 2
	
	for(k = 0 ; k < tau_time ; k++){
	acc_c[k] = 0;
	}
	
	tau_reduced = data_tot - tau_time;								//Define the total number of steps over which you can find accumulations of length tau_time
		
	for(k = 0 ; k < tau_reduced ; k++){
		d1 = data_array1[k] - avg1;				
			for(n = 0 ; n < tau_time ; n++){
				d2 = data_array2[k+n] - avg2;
				corracc[n] += d1*d2;								//Accumulate correlations
				acc_c[n] += 1;
			}
	}
	
	normalize = corracc[0]/acc_c[0];								//Define a normalization constant
	
	for(k = 0 ; k < tau_time ; k++){								//Calculate the normalized correlation of the two data sets
		corr[k] = corracc[k]/acc_c[k];
		corr[k] = corr[k]/normalize;
	}
	
	fp = fopen(output,"w");											//Write correlation data to correlation.dat
		fprintf(fp,"Tau\tCorrelation\n\n");
			for(k = 0 ; k < tau_time ; k++){
				fprintf(fp,"%d\t%lf\n", k, corr[k]);
			}
	fclose(fp);
	
	printf("\n\nProgram Finished, Correlation data printed in correlation.dat\n\n");
	
}