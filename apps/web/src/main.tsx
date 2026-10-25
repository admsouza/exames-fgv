import React from 'react';
import { createRoot } from 'react-dom/client';
import './styles.css';

function App() {
  return (
    <main className="page">
      <section className="card">
        <span className="eyebrow">Exames FGV</span>
        <h1>Preparação orientada por dados</h1>
        <p>
          A nova aplicação armazenará provas, respostas, confiança, tempo e padrões de erro
          no PostgreSQL para construir seu raio-X de desempenho.
        </p>
        <div className="status">
          <strong>Arquitetura</strong>
          <span>React + NestJS + PostgreSQL</span>
        </div>
      </section>
    </main>
  );
}

createRoot(document.getElementById('root')!).render(
  <React.StrictMode>
    <App />
  </React.StrictMode>,
);
