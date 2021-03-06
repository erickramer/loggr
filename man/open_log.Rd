% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/connection.R
\name{open_log}
\alias{open_log}
\title{Open a log file for loggr}
\usage{
open_log(description = "", open = "a", ...)
}
\arguments{
\item{description}{A character or a connection.}

\item{open}{The mode for opening the connect. See \code{\link{file}}}

\item{...}{Additional parameters passed to \code{\link{file}}}
}
\description{
This opens a log file for \code{\link{loggr}}. The output for all
calls to \code{\link{loggr}} will be redirected to this file. The user can
either specify a file name or pass a connection to a file.
}
\examples{

open_log("mylog.txt")

f = gzfile("mylog.gz", mode="wb")
open_log(f)

}
\seealso{
\code{\link{close_log}}
}

