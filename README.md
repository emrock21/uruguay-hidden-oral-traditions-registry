# Uruguay Hidden Oral Traditions Registry

On-chain registry of real, lesser-known rural oral traditions and gaucho knowledge from Uruguay.

This contract focuses on practices that are culturally significant but not mainstream or globally documented, such as:

- Improvised payada duels  
- Rural healing and herbal knowledge  
- Campfire storytelling and legends  
- Work songs and cattle drive chants  
- Gaucho crafts and intergenerational countryside skills  

Each entry is tied to a specific Uruguayan region and town, emphasizing cultural context rather than generic folklore.

---

## Why a country-specific contract?

Uruguay’s countryside identity is strongly shaped by oral traditions and gaucho culture.  
Many of its most meaningful practices are:

- Preserved in small rural communities  
- Transmitted orally across generations  
- Central to local memory, identity, and social cohesion  

A global “oral traditions registry” would dilute this context.  
This registry is explicitly designed for Uruguay’s rural oral heritage.

---

## Contract

Deployed on Base:  
`0x8cb5300d3940277581c0b81e3acfbef860b5ca75`  
🔗 https://basescan.org/address/0x8cb5300d3940277581c0b81e3acfbef860b5ca75#code

---

## Data model

Each recorded tradition includes:

- `region` – e.g., Tacuarembo, Cerro Largo, Rocha  
- `town` – specific locality or rural community  
- `traditionName` – name of the oral tradition or practice  
- `practiceType` – type of practice (singing, healing, craft, etc.)  
- `culturalNote` – brief factual context  
- `whyItMatters` – explanation of cultural significance  
- `likes` / `dislikes` – community voting on relevance and usefulness  

---

## Example entries (conceptual)

These are examples of the kind of traditions this registry is meant to capture:

- An improvised payada style preserved by local singers  
- A rural healing practice using native plants  
- A campfire storytelling tradition maintained by elders  
- A work chant used during cattle drives  
- A specific leather braiding technique passed down in one family  

Frontends and communities are responsible for ensuring that entries are real and culturally meaningful.

---

## Contract interface

Main functions:

solidity

recordTradition(
  string region,
  string town,
  string traditionName,
  string practiceType,
  string culturalNote,
  string whyItMatters
);

voteTradition(uint256 id, bool like);

totalTraditions();

---

## Conclusion

This contract provides a country-specific, culturally grounded registry for Uruguay.
It is not a generic folklore list, but a curated log of rural oral traditions and gaucho knowledge that matter to the cultural memory and identity of the nation, with community voting to highlight what truly deserves to be remembered.
