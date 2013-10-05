
## ----install, eval=FALSE-------------------------------------------------
## install.packages("devtools")
## require(devtools)
## install_github("alm", "rOpenSci")


## ----load, message=FALSE, warning=FALSE----------------------------------
library(alm)


## ----alm1, message=FALSE, warning=FALSE, comment=NA, cache=TRUE----------
alm(doi="10.1371/journal.pone.0029797")[,-c(6:8)]


## ----alm2, message=FALSE, warning=FALSE, comment=NA, cache=TRUE----------
out <- alm(doi='10.1371/journal.pone.0029797', info='detail')
## totals
out[["totals"]][,-c(6:8)]
## history
head(out[["history"]])


## ----alm3, message=FALSE, warning=FALSE, comment=NA, cache=TRUE----------
# A single PubMed ID (pmid)
alm(pmid=22590526)[,-c(6:8)]
 
# A single PubMed Central ID (pmcid)
alm(pmcid=212692)[,-c(6:8)]
 
# A single Mendeley UUID (mdid)
alm(mdid="35791700-6d00-11df-a2b2-0026b95e3eb7")[,-c(6:8)]


## ----xxx, message=FALSE, warning=FALSE, comment=NA, cache=TRUE-----------
dois <- c('10.1371/journal.pone.0001543','10.1371/journal.pone.0040117',
	'10.1371/journal.pone.0029797','10.1371/journal.pone.0039395')
out <- alm(doi=dois)
lapply(out, head)


## ----byyear, message=FALSE, warning=FALSE, comment=NA, cache=TRUE--------
alm(doi='10.1371/journal.pone.0036240', sum_metrics='year')[,-c(6:8)]


## ----easytocombine, message=FALSE, warning=FALSE, comment=NA, cache=TRUE----
alm(doi='10.1371/journal.pone.0035869', total_details=TRUE)[,3:10]


## ----totalmets, message=FALSE, warning=FALSE, comment=NA, cache=TRUE-----
out <- alm(doi='10.1371/journal.pone.0001543', info='detail')
almplot(out, type='totalmetrics')


## ----almevents, message=FALSE, warning=FALSE, comment=NA, cache=TRUE-----
out <- almevents(doi="10.1371/journal.pone.0029797")
names(out) # names of sources
out <- out[!out %in% c("sorry, no events content yet","parser not written yet")] # remove those with no data
out[["pmc"]] # get the results for PubMed Central
out[["twitter"]] # get the results for twitter (boo, there aren't any)
out[c("twitter","crossref")] # get the results for two sources


## ----signposts1, message=FALSE, warning=FALSE, comment=NA, cache=TRUE----
dat <- signposts(doi="10.1371/journal.pone.0029797")
plot_signposts(input=dat)


## ----signposts2, message=FALSE, warning=FALSE, comment=NA, cache=TRUE----
dois <- c('10.1371/journal.pone.0001543','10.1371/journal.pone.0040117','10.1371/journal.pone.0029797','10.1371/journal.pone.0039395')
dat <- signposts(doi=dois)
plot_signposts(input=dat)


## ----plot_densityprep, message=FALSE, warning=FALSE, comment=NA, cache=TRUE----
library(rplos); library(plyr)
dois <- searchplos(terms='*:*', fields="id", toquery=list('cross_published_journal_key:PLoSONE', 'doc_type:full', 'publication_date:[2010-01-01T00:00:00Z TO 2010-12-31T23:59:59Z]'), limit=100, key="WQcDSXml2VSWx3P")
alm <- alm(doi=do.call(c,dois$id), total_details=TRUE)
alm <- ldply(alm)


## ----plot_densityplot1, message=FALSE, warning=FALSE, comment=NA, cache=TRUE----
plot_density(alm)


## ----plot_densityplot2, message=FALSE, warning=FALSE, comment=NA, cache=TRUE----
plot_density(alm, color="#EFA5A5")


## ----plot_densityplot3, message=FALSE, warning=FALSE, comment=NA, cache=TRUE----
plot_density(alm, title="Scopus citations from 2010")


## ----plot_densityplot4, message=FALSE, warning=FALSE, comment=NA, cache=TRUE----
names(alm)[1:35]
plot_density(input=alm, source="crossref_citations")


## ----plot_densityplot5, message=FALSE, warning=FALSE, comment=NA, cache=TRUE----
plot_density(input=alm, source=c("counter_total","crossref_citations","twitter_total","wos_citations"), color=c("#83DFB4","#EFA5A5","#CFD470","#B2C9E4"))


## ----almtotals, message=FALSE, warning=FALSE, comment=NA, cache=TRUE-----
almtotals(doi = '10.1371/journal.pbio.0000012')


## ----almtitle, message=FALSE, warning=FALSE, comment=NA, cache=TRUE------
almtitle(doi='10.1371/journal.pbio.0000012')


