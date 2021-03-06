\name{GetDODSDates}
\alias{GetDODSDates}
\title{
Find available model run dates for data on the GrADS - DODS system.
}
\description{
This function checks the GrADS data server to see what dates and model subsets are available for model specified by ABBREV
}
\usage{
GetDODSDates(abbrev, archive=FALSE, request.sleep=1, https = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{abbrev}{
  A model abbreviation as specified in \code{\link{NOMADSRealTimeList}} or \code{\link{NOMADSArchiveList}}.
}
  \item{archive}{
  Whether the model is on the NCEP real time server (\code{FALSE}) or on the NCDC model archive server (\code{TRUE}).
}
  \item{request.sleep}{
  Seconds to pause between HTTP requests when scanning model pages - this prevents timeouts. Default \code{1}.
  }
  \item{https}{
  Whether to use HTTP or HTTPS.  Default FALSE (use HTTPS)
  } 
}
\details{
This function determines which dates are available for download for a particular model through the GrADS - DODS system.
Once the user determines which dates are available, the output of this function can be passed to \code{\link{GetDODSModelRuns}} to determine which model runs can be downloaded.
}
\value{
\item{model}{The model that was requested.}
\item{date}{A list of model run dates available for download.}
\item{url}{A list of URLs corresponding to the model run dates.}
}
\author{
Daniel C. Bowman \email{daniel.bowman@unc.edu}
}
\note{
Sometimes, sending lots of HTTP requests in rapid succession can cause errors.
If messages resembling \code{"Error: failed to load HTTP resource"} appear, try increasing \code{request.sleep}.
The code will take longer to execute but it will be more likely to finish successfully.
}

\seealso{
\code{\link{GetDODSModelRuns}}, \code{\link{DODSGrab}}
}
\examples{

#An example for the Global Forecast System 0.5 degree model

#Get the latest model url and date
abbrev <- "gfs_0p50"
\dontrun{
urls.out <- GetDODSDates(abbrev)
print(paste("Most recent model run:",tail(urls.out$date, 1)))

#Get model dates from the GFS archive
abbrev <- "gfs-avn-hi"
urls.out <- GetDODSDates(abbrev, archive = TRUE, request.sleep = 1)
}

}

\keyword{ utilities }
