# from : https://tex.stackexchange.com/a/44316
add_cus_dep('glo', 'gls', 0, 'run_makeglossaries');
add_cus_dep('acn', 'acr', 0, 'run_makeglossaries');
sub run_makeglossaries {
  if ( $silent ) {
    system "makeglossaries -q '$_[0]'";
  }
  else {
    system "makeglossaries '$_[0]'";
  };
}

# for cleaning
push @generated_exts, 'glo', 'gls', 'glg';
push @generated_exts, 'acn', 'acr', 'alg';

# some help : https://tex.stackexchange.com/questions/62061/problem-with-the-nomenclature
add_cus_dep('nlo', 'nls', 0, 'run_makeindex_for_nomenclature');
sub run_makeindex_for_nomenclature {
  if ( $silent ) {
    system "makeindex -q '$_[0]'.nlo -s nomencl.ist -o '$_[0]'.nls";
  }
  else {
    system "makeindex '$_[0]'.nlo -s nomencl.ist -o '$_[0]'.nls";
  };
}
# for cleaning
push @generated_exts, 'nlo', 'nls', 'ist';

# other cleaning
push @generated_exts, 'glsdefs', 'run.xml', 'synctex.gz' ;

# push @generated_exts, 'bbl'; # this was not working see below

$clean_ext = 'bbl' # from https://tex.stackexchange.com/a/83386
