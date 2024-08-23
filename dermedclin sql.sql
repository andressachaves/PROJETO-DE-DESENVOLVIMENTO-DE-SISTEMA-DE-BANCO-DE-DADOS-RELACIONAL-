CREATE TABLE IF NOT EXISTS "table_medico" (
	"crm" varchar(255) NOT NULL,
	"cpf" varchar(255) NOT NULL,
	"nome" text NOT NULL,
	"especialidade" text NOT NULL,
	"contato" varchar(255) NOT NULL,
	PRIMARY KEY ("crm")
);

CREATE TABLE IF NOT EXISTS "table_paciente" (
	"cpf" varchar(255) NOT NULL,
	"nome" text NOT NULL,
	"sexo" varchar(255) NOT NULL,
	"data_de_nascimento" date NOT NULL,
	"peso" float NOT NULL,
	"altura" float NOT NULL,
	"tipo_sanguineo" varchar(255) NOT NULL,
	"endereço" varchar(255) NOT NULL,
	"contato" varchar(255) NOT NULL,
	PRIMARY KEY ("cpf")
);

CREATE TABLE IF NOT EXISTS "table_exames" (
	"id" int NOT NULL,
	"tipo" varchar(255) NOT NULL,
	"resultado" int NOT NULL,
	PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "table_consulta" (
	"data" varchar(255) NOT NULL UNIQUE,
	"custo" int NOT NULL,
	"hora" varchar(255) NOT NULL,
	PRIMARY KEY ("data")
);

CREATE TABLE IF NOT EXISTS "table_diagnostico" (
	"id" int NOT NULL,
	"resultado" int NOT NULL,
	PRIMARY KEY ("id")
);

ALTER TABLE "table_medico" ADD CONSTRAINT "table_medico_fk1" FOREIGN KEY ("cpf") REFERENCES "table_paciente"("id");
ALTER TABLE "table_paciente" ADD CONSTRAINT "table_paciente_fk1" FOREIGN KEY ("nome") REFERENCES "table_consulta"("data");
ALTER TABLE "table_exames" ADD CONSTRAINT "table_exames_fk1" FOREIGN KEY ("tipo") REFERENCES "table_diagnostico"("id");
ALTER TABLE "table_consulta" ADD CONSTRAINT "table_consulta_fk1" FOREIGN KEY ("custo") REFERENCES "table_medico"("crm");
ALTER TABLE "table_diagnostico" ADD CONSTRAINT "table_diagnostico_fk1" FOREIGN KEY ("resultado") REFERENCES "table_consulta"("data");