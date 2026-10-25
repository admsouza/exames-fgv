CREATE TABLE "Prova" (
  "id" TEXT NOT NULL,
  "slug" TEXT NOT NULL,
  "titulo" TEXT NOT NULL,
  "orgao" TEXT NOT NULL,
  "ano" INTEGER NOT NULL,
  "cargo" TEXT NOT NULL,
  "banca" TEXT NOT NULL DEFAULT 'FGV',
  "pdfUrl" TEXT,
  "criadaEm" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT "Prova_pkey" PRIMARY KEY ("id")
);

CREATE TABLE "Questao" (
  "id" TEXT NOT NULL,
  "provaId" TEXT NOT NULL,
  "numero" INTEGER NOT NULL,
  "disciplina" TEXT,
  "assunto" TEXT,
  "subassunto" TEXT,
  "enunciado" TEXT,
  "anulada" BOOLEAN NOT NULL DEFAULT false,
  "gabarito" TEXT,
  CONSTRAINT "Questao_pkey" PRIMARY KEY ("id")
);

CREATE TABLE "Alternativa" (
  "id" TEXT NOT NULL,
  "questaoId" TEXT NOT NULL,
  "letra" TEXT NOT NULL,
  "texto" TEXT NOT NULL,
  CONSTRAINT "Alternativa_pkey" PRIMARY KEY ("id")
);

CREATE TABLE "Usuario" (
  "id" TEXT NOT NULL,
  "nome" TEXT NOT NULL,
  "email" TEXT,
  "criadoEm" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT "Usuario_pkey" PRIMARY KEY ("id")
);

CREATE TABLE "SessaoProva" (
  "id" TEXT NOT NULL,
  "provaId" TEXT NOT NULL,
  "usuarioId" TEXT,
  "iniciadaEm" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "finalizadaEm" TIMESTAMP(3),
  CONSTRAINT "SessaoProva_pkey" PRIMARY KEY ("id")
);

CREATE TABLE "RespostaUsuario" (
  "id" TEXT NOT NULL,
  "sessaoId" TEXT NOT NULL,
  "questaoId" TEXT NOT NULL,
  "resposta" TEXT,
  "acertou" BOOLEAN,
  "confianca" TEXT,
  "tempoSegundos" INTEGER,
  "tipoErro" TEXT,
  "alternativasDuvida" TEXT[] DEFAULT ARRAY[]::TEXT[],
  "observacao" TEXT,
  "respondidaEm" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT "RespostaUsuario_pkey" PRIMARY KEY ("id")
);

CREATE TABLE "Revisao" (
  "id" TEXT NOT NULL,
  "questaoId" TEXT NOT NULL,
  "usuarioId" TEXT,
  "agendadaPara" TIMESTAMP(3) NOT NULL,
  "concluidaEm" TIMESTAMP(3),
  "motivo" TEXT,
  "criadoEm" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT "Revisao_pkey" PRIMARY KEY ("id")
);

CREATE UNIQUE INDEX "Prova_slug_key" ON "Prova"("slug");
CREATE UNIQUE INDEX "Usuario_email_key" ON "Usuario"("email");
CREATE UNIQUE INDEX "Questao_provaId_numero_key" ON "Questao"("provaId", "numero");
CREATE INDEX "Questao_disciplina_assunto_subassunto_idx" ON "Questao"("disciplina", "assunto", "subassunto");
CREATE UNIQUE INDEX "Alternativa_questaoId_letra_key" ON "Alternativa"("questaoId", "letra");
CREATE UNIQUE INDEX "RespostaUsuario_sessaoId_questaoId_key" ON "RespostaUsuario"("sessaoId", "questaoId");
CREATE INDEX "RespostaUsuario_acertou_confianca_tipoErro_idx" ON "RespostaUsuario"("acertou", "confianca", "tipoErro");

ALTER TABLE "Questao" ADD CONSTRAINT "Questao_provaId_fkey" FOREIGN KEY ("provaId") REFERENCES "Prova"("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "Alternativa" ADD CONSTRAINT "Alternativa_questaoId_fkey" FOREIGN KEY ("questaoId") REFERENCES "Questao"("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "SessaoProva" ADD CONSTRAINT "SessaoProva_provaId_fkey" FOREIGN KEY ("provaId") REFERENCES "Prova"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE "SessaoProva" ADD CONSTRAINT "SessaoProva_usuarioId_fkey" FOREIGN KEY ("usuarioId") REFERENCES "Usuario"("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "RespostaUsuario" ADD CONSTRAINT "RespostaUsuario_sessaoId_fkey" FOREIGN KEY ("sessaoId") REFERENCES "SessaoProva"("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "RespostaUsuario" ADD CONSTRAINT "RespostaUsuario_questaoId_fkey" FOREIGN KEY ("questaoId") REFERENCES "Questao"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
