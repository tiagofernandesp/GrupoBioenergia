
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 11/21/2014 20:15:45
-- Generated from EDMX file: C:\Users\RC\Desktop\ES\GrupoBioenergia\GrupoBioenergia\DbBioenergia.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [Ciener];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_Anexo_TipoFicheiro]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Anexo] DROP CONSTRAINT [FK_Anexo_TipoFicheiro];
GO
IF OBJECT_ID(N'[dbo].[FK_Comentario_Noticia]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Comentario] DROP CONSTRAINT [FK_Comentario_Noticia];
GO
IF OBJECT_ID(N'[dbo].[FK_Comentario_Utilizador]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Comentario] DROP CONSTRAINT [FK_Comentario_Utilizador];
GO
IF OBJECT_ID(N'[dbo].[FK_Documento_Publicacao]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Documento] DROP CONSTRAINT [FK_Documento_Publicacao];
GO
IF OBJECT_ID(N'[dbo].[FK_Documento_TipoFicheiro]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Documento] DROP CONSTRAINT [FK_Documento_TipoFicheiro];
GO
IF OBJECT_ID(N'[dbo].[FK_Mensagem_Utilizador]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Mensagem] DROP CONSTRAINT [FK_Mensagem_Utilizador];
GO
IF OBJECT_ID(N'[dbo].[FK_Noticia_Topico]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Noticia] DROP CONSTRAINT [FK_Noticia_Topico];
GO
IF OBJECT_ID(N'[dbo].[FK_Online_Utilizador]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Online] DROP CONSTRAINT [FK_Online_Utilizador];
GO
IF OBJECT_ID(N'[dbo].[FK_Publicacao_Utilizador]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Publicacao] DROP CONSTRAINT [FK_Publicacao_Utilizador];
GO
IF OBJECT_ID(N'[dbo].[FK_Utilizador_TipoAcesso]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Utilizador] DROP CONSTRAINT [FK_Utilizador_TipoAcesso];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Anexo]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Anexo];
GO
IF OBJECT_ID(N'[dbo].[Comentario]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Comentario];
GO
IF OBJECT_ID(N'[dbo].[Documento]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Documento];
GO
IF OBJECT_ID(N'[dbo].[Mensagem]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Mensagem];
GO
IF OBJECT_ID(N'[dbo].[Noticia]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Noticia];
GO
IF OBJECT_ID(N'[dbo].[Online]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Online];
GO
IF OBJECT_ID(N'[dbo].[Publicacao]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Publicacao];
GO
IF OBJECT_ID(N'[dbo].[sysdiagrams]', 'U') IS NOT NULL
    DROP TABLE [dbo].[sysdiagrams];
GO
IF OBJECT_ID(N'[dbo].[TipoAcesso]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TipoAcesso];
GO
IF OBJECT_ID(N'[dbo].[TipoFicheiro]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TipoFicheiro];
GO
IF OBJECT_ID(N'[dbo].[Topico]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Topico];
GO
IF OBJECT_ID(N'[dbo].[Utilizador]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Utilizador];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Anexo'
CREATE TABLE [dbo].[Anexo] (
    [IDAnexo] int IDENTITY(1,1) NOT NULL,
    [Anexo1] varbinary(max)  NOT NULL,
    [IDNoticia] int  NOT NULL,
    [IDTFicheiro] int  NOT NULL
);
GO

-- Creating table 'Comentario'
CREATE TABLE [dbo].[Comentario] (
    [IDComentario] int IDENTITY(1,1) NOT NULL,
    [Titulo] nvarchar(100)  NOT NULL,
    [Texto] nvarchar(max)  NOT NULL,
    [IDNoticia] int  NOT NULL,
    [IDUtilizador] int  NOT NULL
);
GO

-- Creating table 'Documento'
CREATE TABLE [dbo].[Documento] (
    [IDDoc] int IDENTITY(1,1) NOT NULL,
    [Doc] varbinary(max)  NOT NULL,
    [IDTFicheiro] int  NOT NULL,
    [IDPublicacao] int  NOT NULL
);
GO

-- Creating table 'Mensagem'
CREATE TABLE [dbo].[Mensagem] (
    [IDMensagem] int IDENTITY(1,1) NOT NULL,
    [Texto] nchar(4000)  NULL,
    [Data] datetime  NOT NULL,
    [IDUtilizador] int  NOT NULL
);
GO

-- Creating table 'Noticia'
CREATE TABLE [dbo].[Noticia] (
    [IDNoticia] int IDENTITY(1,1) NOT NULL,
    [Titulo] nvarchar(100)  NOT NULL,
    [Data] datetime  NOT NULL,
    [IDUtilizador] int  NOT NULL,
    [IDTopico] int  NOT NULL,
    [IDPublicacao] int  NULL
);
GO

-- Creating table 'Online'
CREATE TABLE [dbo].[Online] (
    [IP] nvarchar(100)  NOT NULL,
    [IDUtilizador] int  NOT NULL
);
GO

-- Creating table 'Publicacao'
CREATE TABLE [dbo].[Publicacao] (
    [IDPublicacao] int IDENTITY(1,1) NOT NULL,
    [Titulo] nvarchar(100)  NOT NULL,
    [Data] datetime  NOT NULL,
    [Texto] nvarchar(max)  NOT NULL,
    [IDUtilizador] int  NOT NULL
);
GO

-- Creating table 'sysdiagrams'
CREATE TABLE [dbo].[sysdiagrams] (
    [name] nvarchar(128)  NOT NULL,
    [principal_id] int  NOT NULL,
    [diagram_id] int IDENTITY(1,1) NOT NULL,
    [version] int  NULL,
    [definition] varbinary(max)  NULL
);
GO

-- Creating table 'TipoAcesso'
CREATE TABLE [dbo].[TipoAcesso] (
    [IDTAcesso] int IDENTITY(1,1) NOT NULL,
    [Tipo] nvarchar(50)  NOT NULL
);
GO

-- Creating table 'TipoFicheiro'
CREATE TABLE [dbo].[TipoFicheiro] (
    [IDFicheiro] int IDENTITY(1,1) NOT NULL,
    [TipoFicheiro1] nvarchar(50)  NOT NULL
);
GO

-- Creating table 'Topico'
CREATE TABLE [dbo].[Topico] (
    [IDTopico] int IDENTITY(1,1) NOT NULL,
    [Titulo] nvarchar(100)  NOT NULL,
    [Descricao] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Utilizador'
CREATE TABLE [dbo].[Utilizador] (
    [IDUtilizador] int IDENTITY(1,1) NOT NULL,
    [Password] nvarchar(50)  NOT NULL,
    [PNome] nvarchar(50)  NOT NULL,
    [UNome] nvarchar(50)  NOT NULL,
    [DataNasc] datetime  NULL,
    [ContactoTele] nvarchar(50)  NULL,
    [ContactoMail] nvarchar(100)  NULL,
    [Foto] varbinary(max)  NULL,
    [Curriculum] varbinary(max)  NULL,
    [IDAcesso] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [IDAnexo] in table 'Anexo'
ALTER TABLE [dbo].[Anexo]
ADD CONSTRAINT [PK_Anexo]
    PRIMARY KEY CLUSTERED ([IDAnexo] ASC);
GO

-- Creating primary key on [IDComentario] in table 'Comentario'
ALTER TABLE [dbo].[Comentario]
ADD CONSTRAINT [PK_Comentario]
    PRIMARY KEY CLUSTERED ([IDComentario] ASC);
GO

-- Creating primary key on [IDDoc] in table 'Documento'
ALTER TABLE [dbo].[Documento]
ADD CONSTRAINT [PK_Documento]
    PRIMARY KEY CLUSTERED ([IDDoc] ASC);
GO

-- Creating primary key on [IDMensagem] in table 'Mensagem'
ALTER TABLE [dbo].[Mensagem]
ADD CONSTRAINT [PK_Mensagem]
    PRIMARY KEY CLUSTERED ([IDMensagem] ASC);
GO

-- Creating primary key on [IDNoticia] in table 'Noticia'
ALTER TABLE [dbo].[Noticia]
ADD CONSTRAINT [PK_Noticia]
    PRIMARY KEY CLUSTERED ([IDNoticia] ASC);
GO

-- Creating primary key on [IDUtilizador] in table 'Online'
ALTER TABLE [dbo].[Online]
ADD CONSTRAINT [PK_Online]
    PRIMARY KEY CLUSTERED ([IDUtilizador] ASC);
GO

-- Creating primary key on [IDPublicacao] in table 'Publicacao'
ALTER TABLE [dbo].[Publicacao]
ADD CONSTRAINT [PK_Publicacao]
    PRIMARY KEY CLUSTERED ([IDPublicacao] ASC);
GO

-- Creating primary key on [diagram_id] in table 'sysdiagrams'
ALTER TABLE [dbo].[sysdiagrams]
ADD CONSTRAINT [PK_sysdiagrams]
    PRIMARY KEY CLUSTERED ([diagram_id] ASC);
GO

-- Creating primary key on [IDTAcesso] in table 'TipoAcesso'
ALTER TABLE [dbo].[TipoAcesso]
ADD CONSTRAINT [PK_TipoAcesso]
    PRIMARY KEY CLUSTERED ([IDTAcesso] ASC);
GO

-- Creating primary key on [IDFicheiro] in table 'TipoFicheiro'
ALTER TABLE [dbo].[TipoFicheiro]
ADD CONSTRAINT [PK_TipoFicheiro]
    PRIMARY KEY CLUSTERED ([IDFicheiro] ASC);
GO

-- Creating primary key on [IDTopico] in table 'Topico'
ALTER TABLE [dbo].[Topico]
ADD CONSTRAINT [PK_Topico]
    PRIMARY KEY CLUSTERED ([IDTopico] ASC);
GO

-- Creating primary key on [IDUtilizador] in table 'Utilizador'
ALTER TABLE [dbo].[Utilizador]
ADD CONSTRAINT [PK_Utilizador]
    PRIMARY KEY CLUSTERED ([IDUtilizador] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [IDTFicheiro] in table 'Anexo'
ALTER TABLE [dbo].[Anexo]
ADD CONSTRAINT [FK_Anexo_TipoFicheiro]
    FOREIGN KEY ([IDTFicheiro])
    REFERENCES [dbo].[TipoFicheiro]
        ([IDFicheiro])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Anexo_TipoFicheiro'
CREATE INDEX [IX_FK_Anexo_TipoFicheiro]
ON [dbo].[Anexo]
    ([IDTFicheiro]);
GO

-- Creating foreign key on [IDNoticia] in table 'Comentario'
ALTER TABLE [dbo].[Comentario]
ADD CONSTRAINT [FK_Comentario_Noticia]
    FOREIGN KEY ([IDNoticia])
    REFERENCES [dbo].[Noticia]
        ([IDNoticia])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Comentario_Noticia'
CREATE INDEX [IX_FK_Comentario_Noticia]
ON [dbo].[Comentario]
    ([IDNoticia]);
GO

-- Creating foreign key on [IDUtilizador] in table 'Comentario'
ALTER TABLE [dbo].[Comentario]
ADD CONSTRAINT [FK_Comentario_Utilizador]
    FOREIGN KEY ([IDUtilizador])
    REFERENCES [dbo].[Utilizador]
        ([IDUtilizador])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Comentario_Utilizador'
CREATE INDEX [IX_FK_Comentario_Utilizador]
ON [dbo].[Comentario]
    ([IDUtilizador]);
GO

-- Creating foreign key on [IDPublicacao] in table 'Documento'
ALTER TABLE [dbo].[Documento]
ADD CONSTRAINT [FK_Documento_Publicacao]
    FOREIGN KEY ([IDPublicacao])
    REFERENCES [dbo].[Publicacao]
        ([IDPublicacao])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Documento_Publicacao'
CREATE INDEX [IX_FK_Documento_Publicacao]
ON [dbo].[Documento]
    ([IDPublicacao]);
GO

-- Creating foreign key on [IDTFicheiro] in table 'Documento'
ALTER TABLE [dbo].[Documento]
ADD CONSTRAINT [FK_Documento_TipoFicheiro]
    FOREIGN KEY ([IDTFicheiro])
    REFERENCES [dbo].[TipoFicheiro]
        ([IDFicheiro])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Documento_TipoFicheiro'
CREATE INDEX [IX_FK_Documento_TipoFicheiro]
ON [dbo].[Documento]
    ([IDTFicheiro]);
GO

-- Creating foreign key on [IDUtilizador] in table 'Mensagem'
ALTER TABLE [dbo].[Mensagem]
ADD CONSTRAINT [FK_Mensagem_Utilizador]
    FOREIGN KEY ([IDUtilizador])
    REFERENCES [dbo].[Utilizador]
        ([IDUtilizador])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Mensagem_Utilizador'
CREATE INDEX [IX_FK_Mensagem_Utilizador]
ON [dbo].[Mensagem]
    ([IDUtilizador]);
GO

-- Creating foreign key on [IDTopico] in table 'Noticia'
ALTER TABLE [dbo].[Noticia]
ADD CONSTRAINT [FK_Noticia_Topico]
    FOREIGN KEY ([IDTopico])
    REFERENCES [dbo].[Topico]
        ([IDTopico])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Noticia_Topico'
CREATE INDEX [IX_FK_Noticia_Topico]
ON [dbo].[Noticia]
    ([IDTopico]);
GO

-- Creating foreign key on [IDUtilizador] in table 'Online'
ALTER TABLE [dbo].[Online]
ADD CONSTRAINT [FK_Online_Utilizador]
    FOREIGN KEY ([IDUtilizador])
    REFERENCES [dbo].[Utilizador]
        ([IDUtilizador])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [IDUtilizador] in table 'Publicacao'
ALTER TABLE [dbo].[Publicacao]
ADD CONSTRAINT [FK_Publicacao_Utilizador]
    FOREIGN KEY ([IDUtilizador])
    REFERENCES [dbo].[Utilizador]
        ([IDUtilizador])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Publicacao_Utilizador'
CREATE INDEX [IX_FK_Publicacao_Utilizador]
ON [dbo].[Publicacao]
    ([IDUtilizador]);
GO

-- Creating foreign key on [IDAcesso] in table 'Utilizador'
ALTER TABLE [dbo].[Utilizador]
ADD CONSTRAINT [FK_Utilizador_TipoAcesso]
    FOREIGN KEY ([IDAcesso])
    REFERENCES [dbo].[TipoAcesso]
        ([IDTAcesso])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Utilizador_TipoAcesso'
CREATE INDEX [IX_FK_Utilizador_TipoAcesso]
ON [dbo].[Utilizador]
    ([IDAcesso]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------