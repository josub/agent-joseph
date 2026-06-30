# US LLC Setup Guide — Non-Resident Founder (Sweden/Korea)

> Saved to working memory: 2026-06-29
> Source: us-llc-guide.md (provided by user, created 2026-06-28)
> Context: Solo SaaS founder, Swedish citizen, Korea tax base, F-4 visa.
> Purpose: reference for when we're ready to incorporate the LLC (likely for the
> contact-scanner / Leadodex business). Pull this up at incorporation time.

---

## Structure Overview

```
Stripe/Customers -> Mercury (US LLC) -> Wise -> Korean Bank (personal)
```

---

## Entity Setup

### State: Wyoming
- No state income tax
- Low fees, strong privacy
- Convert to Delaware C-Corp later if raising VC

### Formation Options
| Method | Cost | Effort |
|--------|------|--------|
| Stripe Atlas | $500 one-time | Minimal, recommended |
| DIY (Wyoming SOS) | ~$200 | Moderate |

### Stripe Atlas includes:
- LLC formation
- EIN procurement
- Registered agent (year 1)
- Operating agreement
- Mercury account opened simultaneously

---

## Annual Costs

| Item | Cost |
|------|------|
| Registered agent | ~$100/yr |
| Wyoming annual report | $60/yr |
| Form 5472 CPA (US) | $300-500/yr |
| Korean accountant | KRW 200-400K/yr |
| **Total** | **~$600-800/yr** |

---

## Banking Stack

| Account | Purpose |
|---------|---------|
| **Mercury** | Primary US business account. Stripe payouts land here, pay expenses, owner distributions |
| **Wise** | Currency conversion layer. USD to KRW, cheap transfers |
| **Korean bank** | Personal account, where you live and spend |

- Mercury is a fintech (not a bank), deposits FDIC insured via partner banks
- Up to $5M FDIC coverage via Mercury Vault sweep program
- Everything opened fully remotely, no US visit needed

---

## Tax Structure

### US Federal Tax
- Single-member LLC = disregarded entity (pass-through)
- No US federal income tax if **not Effectively Connected Income (ECI)**
- ECI test: no US employees, no US office, managed from Korea = likely not ECI
- **File Form 5472 + pro-forma 1120 annually regardless** (even if zero tax owed)
- Penalty for missing Form 5472: **$25,000**
- Due: April 15 (extendable to October 15)

### Korean Tax
- Korea taxes worldwide income for residents
- Declare LLC profit as foreign business income
- File 종합소득세 (comprehensive income tax), due May of following year
- US-Korea tax treaty prevents double taxation

### Swedish Tax
- Confirm tax residency properly severed with Skatteverket
- Sweden aggressive about unlimited tax liability if strong ties remain

---

## Money Flow

### Owner Distributions (paying yourself)
- Transfer Mercury -> Wise -> Korean bank
- Label as "Owner Distribution" or "Member Draw" in Mercury memo
- Taxable as income in Korea
- **Not** a salary, no US payroll tax

### Capital Contributions (funding the LLC)
- Wire Korean bank -> Mercury
- Label as "Owner Capital Contribution"
- Not taxable, your own money going in
- Can withdraw contributed capital back out tax-free (not profit)

### Capital Account Logic
```
Contribute $1,000 -> Capital account: $1,000
Withdraw $1,000   -> Capital account: $0   -> Tax free
Withdraw profit   -> Taxable in Korea
```

---

## Business Expenses & Deductions

### Deductible
- SaaS tools, subscriptions, hosting
- Business travel (flights, hotels, transport)
- Meals at 50% during business trips
- Conference tickets
- Accounting/legal fees
- Hardware (primarily business use)

### Business Travel Rules
- Primary purpose must be business (>50% of days)
- Applies globally: Korea to US, Asia, Europe all valid
- Write a dated "trip purpose" note before each trip
- Keep: calendar invites, conference tickets, email threads

### Documentation Habit
- Photo every receipt immediately
- Google Drive folder: Year -> Month
- Note: amount, purpose, who you met

---

## Tool Stack

| Tool | Purpose | Cost |
|------|---------|------|
| Wave | Bookkeeping, P&L, invoicing | Free |
| Mercury | US banking + expense tracking | Free |
| Wise | International transfers | Per transfer |
| Google Drive | Receipt storage | Free |
| Expat CPA | Form 5472 filing | $300-500/yr |
| Korean accountant | Korean tax return | KRW 200-400K/yr |

QuickBooks not needed until employees or inventory.

---

## If Raising Later

- Start Wyoming LLC now
- When raising: convert to Delaware C-Corp
- VCs typically require C-Corp regardless of state
- Services: Stripe Atlas or Clerky (~$500-2,000 for conversion)
- Wyoming to Delaware conversion is well-trodden, no penalty for starting in Wyoming

---

## Key Reminders (incorporation checklist)

- [ ] Form LLC via Stripe Atlas
- [ ] Open Mercury + Wise accounts
- [ ] Get EIN (Atlas handles this)
- [ ] Track all expenses from day one in Google Drive
- [ ] Hire expat CPA for annual Form 5472
- [ ] Hire Korean accountant for 종합소득세
- [ ] Confirm Swedish tax residency properly severed
- [ ] Keep capital account log (contributions vs distributions)
