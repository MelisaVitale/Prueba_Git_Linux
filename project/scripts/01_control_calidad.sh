#!/bin/bash
# 01_control_calidad.sh
# Control de calidad de lecturas crudas con FastQC y MultiQC
# Se ejecuta desde la carpeta project/

# 1. Variables
INPUT_DIR="fq"
OUTPUT_DIR="results/fastqc"
THREADS=2

# 2. Crear la carpeta de salida si no existe
echo "Creando carpeta de salida: $OUTPUT_DIR"
mkdir -p "$OUTPUT_DIR"

# 3. FastQC: un reporte de calidad por archivo
echo "Corriendo FastQC..."
fastqc -t "$THREADS" -o "$OUTPUT_DIR" "$INPUT_DIR"/*.fq

# 4. MultiQC: junta todos los reportes en uno
echo "Corriendo MultiQC..."
multiqc "$OUTPUT_DIR" -o results/

echo "Listo. Informe final en results/multiqc_report.html"
