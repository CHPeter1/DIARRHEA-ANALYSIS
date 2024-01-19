#Load required libraries

library(ggplot2)
library(deSolve)
library(reshape2)

# Model inputs

initial_state_values=c(S=9999,I=1,R=0,T=0)
parameters=c(gamma=0.01,beta=0.01,r=0.99,m=0.001,alpha=0.38,K=0.01)

# Time points

time=seq(from=1,to=10,by=1)

# SIR model function 

sirt_model <- function(time,state,parameters){
  with(as.list(c(state,parameters)),{
    N=S+I+R+T
    beta_o=beta*(1-alpha) 
    dS=K-beta*S*I+gamma*R
    dI=beta*S*I-r*I-m*I
    dR=r*I-gamma*R
    dT=m*I
    
    return(list(c(dS,dI,dR,dT)))
  }
  )
}


#Solving the differential equations
output<-as.data.frame(ode(y=initial_state_values,func = sirt_model,parms=parameters,times = time))
out_long=melt(output,id="time")

# To plot the proportion of susceptible, infected and recovered individuals over time
ggplot(data = out_long,          
       aes(x = time, y = value/10000, colour = variable, group = variable)) +  
  geom_line() +xlab("Time (days)")+ylab("S,I,R,T")+scale_color_discrete(name="State")+ main("S,I,R,T")