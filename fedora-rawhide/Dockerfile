################################
# Dockerfile: thedcg/tl-fedora-luatex-noto-cjk:rawhide

# Base
FROM fedora:rawhide

################################
# Dockerfile.common

# Maintainer
LABEL org.opencontainers.image.authors="Gravitates Gaudiales <gaudiales@gmail.com>"

# Timezone
ENV TZ=Asia/Tokyo

# Update
RUN date --iso-8601=ns\
 && dnf upgrade --refresh -y\
 && dnf install -y\
	curl\
	perl\
	  perl-Encode\
	  perl-IPC-Run\
	  perl-IPC-Run-SafeHandles\
	  perl-JSON\
	  perl-URI-Encode\
	  perl-URI\
	zip\
	unzip\
	dos2unix\
	latexmk\
	\
	tzdata\
	bc\
	make\
	git\
	openssh-clients\
	python3-pygments\
	xz\
	texlive-luatex\
	texlive-metapost\
	google-noto-cjk-fonts\
	google-noto-emoji-fonts\
	google-noto-sans-cjk-fonts\
	texlive-base\
	texlive-cjk\
	texlive-haranoaji-extra\
	biber\
	asymptote\
	gnuplot\
	poppler-utils\
	qpdf\
	pngcheck\
	qrencode\
	ImageMagick\
	libtiff-tools\
 && echo "${TZ}" > /etc/timezone\
 && ln -sf "/usr/share/zoneinfo/${TZ}" /etc/localtime\
 && mktexlsr \
 && luaotfload-tool --update \
 && date --iso-8601=ns

# Generate font cache
RUN date --iso-8601=ns\
 && cd /tmp \
 && touch tmplualatex.tex \
 && echo '\\documentclass[a4paper]{ltjsarticle}' >> tmplualatex.tex \
 && echo '\\usepackage[no-math]{fontspec}' >> tmplualatex.tex \
 && echo '\\usepackage[unicode,hidelinks,pdfusetitle]{hyperref}' >> tmplualatex.tex \
 && echo '\\IfFontExistsTF{Source Han Serif Regular}{\\PassOptionsToPackage{sourcehan}{luatexja-preset}\\typeout{** Source Han OTF **}}{%' >> tmplualatex.tex \
 && echo '\\IfFontExistsTF{Noto Serif CJK Regular}{\\PassOptionsToPackage{noto-otc}{luatexja-preset}\\typeout{** Noto CJK OTC **}}{%' >> tmplualatex.tex \
 && echo '\\IfFontExistsTF{Source Han Serif JP Regular}{\\PassOptionsToPackage{sourcehan-jp}{luatexja-preset}\\typeout{** Source Han JP Subset OTF **}}{%' >> tmplualatex.tex \
 && echo '\\IfFontExistsTF{Noto Serif CJK JP Regular}{\\PassOptionsToPackage{noto-otf}{luatexja-preset}\\typeout{** Noto CJK OTF **}}{%' >> tmplualatex.tex \
 && echo '\\typeout{** No Source Han / Noto CJK **}}}}}' >> tmplualatex.tex \
 && echo '\\PassOptionsToPackage{deluxe}{luatexja-preset}' >> tmplualatex.tex \
 && echo '\\usepackage{luatexja-preset}' >> tmplualatex.tex \
 && echo '\\usepackage{luatexja-otf}' >> tmplualatex.tex \
 && echo '\\begin{document}' >> tmplualatex.tex \
 && echo '\\newcommand{\\sample}{0123456789 ABC abc \$x\$ {\\boldmath\$x\$} あいう アイウ 通信}' >> tmplualatex.tex \
 && echo '{\\sample\\par}' >> tmplualatex.tex \
 && echo '\\hrulefill\\par' >> tmplualatex.tex \
 && echo '{\\mcfamily\\ltseries\\sample\\par}' >> tmplualatex.tex \
 && echo '{\\mcfamily\\mdseries\\sample\\par}' >> tmplualatex.tex \
 && echo '{\\mcfamily\\bfseries\\sample\\par}' >> tmplualatex.tex \
 && echo '\\hrulefill\\par' >> tmplualatex.tex \
 && echo '{\\gtfamily\\mdseries\\sample\\par}' >> tmplualatex.tex \
 && echo '{\\gtfamily\\bfseries\\sample\\par}' >> tmplualatex.tex \
 && echo '{\\gtfamily\\ebseries\\sample\\par}' >> tmplualatex.tex \
 && echo '\\hrulefill\\par' >> tmplualatex.tex \
 && echo '{\\mgfamily\\sample\\par}' >> tmplualatex.tex \
 && echo '\\hrulefill\\par' >> tmplualatex.tex \
 && echo '{\\sffamily\\sample\\par}' >> tmplualatex.tex \
 && echo '\\hrulefill\\par' >> tmplualatex.tex \
 && echo '{\\ttfamily\\sample\\par}' >> tmplualatex.tex \
 && echo '\\end{document}' >> tmplualatex.tex \
 && cat tmplualatex.tex \
 && lualatex tmplualatex \
 && rm -rf tmplualatex.* \
 && cd / \
 && date --iso-8601=ns

# End
