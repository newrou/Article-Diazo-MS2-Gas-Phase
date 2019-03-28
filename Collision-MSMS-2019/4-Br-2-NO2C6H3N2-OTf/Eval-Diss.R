
R <- 8.3144589
Pg <- 3.13e-5*133.322
Tg <- 298.15
Cg <- Pg/(R*Tg)

args <- commandArgs(trailingOnly = T)
fname <- args[1]
p_dG <- as.numeric(args[2])
p_E0 <- as.numeric(args[3])
mDiss = read.table(paste0(fname, ".dat"), sep=";", head=TRUE)
Ec <- as.array(mDiss$Collision)
A <- 0.01*as.array(mDiss$Diss)

pdf(paste0(fname, ".pdf"), family="NimbusSan", encoding="KOI8-R.enc")

test_myf <- function(x, caption) {
 dG <- x[1]
 E0 <- x[2]

 Af <- c()
 Sum <- 0.0
 i <- 1
 n <- length(Ec)
 while ( i < n ) {
    k <- exp( (E0 + Ec[i]) / dG )
    Af[i] <- k / ( k + Cg )
    d <- A[i] - Af[i]
#    print( sprintf(" *** %f = %f - %f", d, A[n], Af[n] ) )
    Sum <- Sum + d*d
    i <- i + 1
  }
 mE <- seq(-10, 40, 0.01)
 mA <- c()
 i <- 1
 for (E in mE) {
    k <- exp( (E0 + E) / dG )
    mA[i] <- k / ( k + 1 )
    i <- i + 1
  }
 print( sprintf("dG=%.2f eV   E0=%.2f eV   Quality: %.3e [%s]", dG, E0 , Sum/n, caption), quote = FALSE, justify = "none", row.names = FALSE )
 cap <- sprintf("[%s] dG=%.2f eV  E0=%.2f eV  Quality=%.3e", caption, dG, E0, Sum/n )
 main = "Dissociation"
 location = "topright"
 labels = c("Experimental", "Aproxymation")
 colors = c("black", "green")
 yrange <- 100*range(A, mA)
 xrange <- range(Ec, mE)
 plot(Ec, 100*A, type="p", xlab = "E collision, eV", ylab = "Dissociation degree, %", col=colors[1], main=cap, lwd=3, ylim = yrange, xlim = xrange)
# lines(Ec, 100*Af, col=colors[2], lwd=2)
 lines(mE, 100*mA, col=colors[2], lwd=2)
# lines(mt/3600, mQ2, col="red", lwd=2)
# lines(mt/3600, mQ, col="green", lwd=2)
 legend(location, labels, title = main, fill=colors)
 return(Sum/14)
}

myf <- function(x, caption) {
 dG <- x[1]
 E0 <- x[2]

 Sum <- 0.0
 i <- 1
 n <- length(Ec)
 while ( i < n ) {
    k <- exp( ( E0 + Ec[i] ) / dG )
    Af <- k / ( k + Cg )
    d <- A[i] - Af
    Sum <- Sum + d*d
    i <- i + 1
  }
 return(Sum/n)
}


krnd <- function(x) { runif(1, x-0.05*abs(x), x+0.05*abs(x)) }

par0 <- c(p_dG, p_E0)

#test0 <- test_myf(par0, "Start")
#Cg

ControlPar <- list(trace=0, maxit=100000, abstol=1e-16, reltol=1e-16)

r1 <- optim(sapply(par0, krnd), myf, control=ControlPar )
test1 <- test_myf(r1$par, "Nelder-Mead Opt")

r2 <- optim(sapply(par0, krnd), myf, NULL, method = "BFGS", hessian = TRUE, control=ControlPar)
test2 <- test_myf(r2$par, "BFGS Opt")

r3 <- optim(sapply(par0, krnd), myf,  method = "SANN", control=ControlPar )
test3 <- test_myf(r2$par, "SANN Opt")

rz <- dev.off()
