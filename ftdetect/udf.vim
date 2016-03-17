au BufNewFile,BufRead */dsxqi/procedures/* if expand("<afile>:p:h") =~ "dsxqi/procedures$" | set filetype=udf
au BufNewFile,BufRead */dsxqi/udf/* if expand("<afile>:p:h") =~ "dsxqi/udf$" | set filetype=udf | endif

