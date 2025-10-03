JAVAC      := javac
JAVA       := java
MAIN_CLASS := Bot
JSON_JAR   := json.jar
OUT_DIR    := .

# Detect classpath separator (':' on Unix/macOS, ';' on Windows)
ifeq ($(OS),Windows_NT)
  CP_SEP := ;
else
  CP_SEP := :
endif

CLASSPATH := $(OUT_DIR)$(CP_SEP)$(JSON_JAR)

SRC     := $(wildcard *.java)
CLASSES := $(patsubst %.java,$(OUT_DIR)/%.class,$(SRC))

.PHONY: all run clean

all: $(CLASSES)

# Create output dir if needed
$(OUT_DIR):
	mkdir -p $(OUT_DIR)

# Compile changed .java files into OUT_DIR
$(OUT_DIR)/%.class: %.java | $(OUT_DIR)
	$(JAVAC) -cp $(JSON_JAR) -d $(OUT_DIR) $<

run: all
	$(JAVA) -cp $(CLASSPATH) $(MAIN_CLASS)

clean:
	rm -rf $(OUT_DIR)
