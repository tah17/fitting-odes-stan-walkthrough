//
// This Stan program defines a simple logistic model 
// 
//
functions {
  // Logistic ODE
  vector logistic(real t,
                  vector y,
                  real beta,
                  real K) {
    vector[1] dydt;
    dydt[1] = beta*y[1]*(1 - (y[1]/K));
    return dydt;
  }
}
data {
  int<lower=0> N;  // number of data points
  int<lower=0> T;  // number of time points 
  vector[N] y;  // input data 
  array[T] real time;  
  int<lower=1, upper=T> time_idx[N];  // index of time vector in data 
  int<lower=0, upper=1> include_likelihood;
}
parameters {
  real<lower=0> K;  // carrying capacity
  real<lower=0> beta;   // growth rate
  real<lower=0> y0;  // initial condition
  real<lower=0> sigma;   // noise scale
}
transformed parameters {
  array[T-1] vector[1] mu_hat = ode_rk45(logistic, to_vector({y0}), time[1], time[2:T], beta, K);   // solve ODE
  array[T] vector[1] mu;  // combine solved ODE with ICs
  mu[1, 1] = y0;
  mu[2:T, 1] = mu_hat[, 1];
}
model {
  // priors
  K ~ normal(10, 1);
  beta ~ std_normal();
  sigma ~ std_normal();
  y0 ~ std_normal();
  // likelihood
  if (include_likelihood) y ~ normal(mu[time_idx, 1], sigma);  
}
generated quantities {
  real f_reps[N] = mu[time_idx, 1];  // posterior samples of ode solution
  real y_reps[N] = normal_rng(mu[time_idx, 1], sigma);  // posterior predictive 
}
