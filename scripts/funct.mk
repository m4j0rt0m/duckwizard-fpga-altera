### function define: veritedium AUTO directive ###
define veritedium-command
emacs --batch $(1) -f verilog-auto -f save-buffer >/dev/null 2>&1;
endef

### function define: print sources ###
define print-srcs-command
	@echo -e "$(_info_)\n[INFO] RTL Source Files$(_reset_)";\
	echo -e "$(_segment_)"
	@echo " [+] Verilog Source Files: $(words $(VERILOG_SRC))";\
	for vsrc in $(VERILOG_SRC);\
	do\
		echo "  |-> $${vsrc}";\
	done
	@echo " [+] SystemVerilog Source Files: $(words $(SVERILOG_SRC))";\
	for svsrc in $(SVERILOG_SRC);\
	do\
		echo "  |-> $${svsrc}";\
	done
	@echo " [+] Verilog Headers Files: $(words $(VERILOG_HEADERS) $(SVERILOG_HEADERS))";\
	for vheader in $(VERILOG_HEADERS) $(SVERILOG_HEADERS);\
	do\
		echo "  |-> $${vheader}";\
	done
	@echo " [+] Packages Source Files: $(words $(PACKAGE_SRC))";\
	for psrc in $(PACKAGE_SRC);\
	do\
		echo "  |-> $${psrc}";\
	done
	@echo " [+] Memory Source Files: $(words $(MEM_SRC))";\
	for msrc in $(MEM_SRC);\
	do\
		echo "  |-> $${msrc}";\
	done;\
	echo -e "$(_reset_)"
endef
