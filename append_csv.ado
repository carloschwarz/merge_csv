capture program drop append_csv

program append_csv

capture syntax using/  						///
	[, force								///
		DELIMiters(string asis)				///
		ROWRange(string)					///
		COLRange(string)					///
		VARNames(string)					///
		case(string)						///
		ASDOUBle							///
		ASFLOat								///
		BINDQuotes(string)					///
		STRIPQuotes(string)					///
		NUMERICCols(string)					///
		STRINGCols(string)					///
		MAXQuotedrows(string)				///
		CHARSET(string)						///
		ENCoding(string)]
		
		
		
preserve 
import delimited "`using'",  delimiters(`delimiters') rowrange("`rowrange'") colrange("`colrange'") varnames("`varnames'")  case("`case'") `asdouble' `asfloat'  bindquote(`bindquotes') stripquotes("`stripquotes'")  numericcols("`numericcols'") stringcols("`stringcols'") encoding("`encoding'") maxquotedrows("`maxquotedrows'")  clear
tempfile csv_temp
save "`csv_temp'"
restore

append using "`csv_temp'" , `force' 


end

