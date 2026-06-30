---
type: reference
title: US LLC setup guide — non-resident founder (Sweden/Korea)
description: Reference for incorporating a US LLC as a solo non-resident SaaS founder (Swedish citizen, Korea tax base, F-4 visa). Wyoming LLC via Stripe Atlas; Mercury → Wise → Korean bank money flow; Form 5472 obligations; tax + deduction rules. Pull up at incorporation time.
tags: [reference, llc, incorporation, tax, wyoming, stripe-atlas, mercury, non-resident]
source: us-llc-guide.md provided by Joseph (created 2026-06-28), saved to brain 2026-06-29
created: 2026-06-29
updated: 2026-06-29
---

# US LLC setup guide — non-resident founder

Incorporation reference for when we're ready to set up the LLC (likely for Leadodex /
Business #1). Context: solo SaaS founder, Swedish citizen, Korea tax base, F-4 visa.
Money flow: `Stripe/Customers → Mercury (US LLC) → Wise → Korean bank (personal)`.

## Entity
- **State: Wyoming** — no state income tax, low fees, strong privacy. Convert to Delaware
  C-Corp later if raising VC (well-trodden, no penalty for starting in Wyoming).
- **Formation:** Stripe Atlas (~$500 one-time, recommended) includes LLC formation, EIN,
  registered agent (yr 1), operating agreement, and a Mercury account opened simultaneously.
  DIY via Wyoming SOS is ~$200, more effort.

## Annual costs (~$600-800/yr)
Registered agent ~$100/yr; Wyoming annual report $60/yr; Form 5472 CPA (US) $300-500/yr;
Korean accountant KRW 200-400K/yr.

## Banking stack
- **Mercury** — primary US business account (Stripe payouts land here, pay expenses, owner
  distributions). Fintech, not a bank; deposits FDIC-insured via partner banks, up to $5M via
  Vault sweep. Opened fully remotely, no US visit.
- **Wise** — currency conversion (USD → KRW), cheap transfers.
- **Korean bank** — personal account where you live and spend.

## Tax
- **US federal:** single-member LLC = disregarded entity (pass-through). No US federal income
  tax if **not Effectively Connected Income (ECI)** — no US employees/office, managed from
  Korea = likely not ECI. **But file Form 5472 + pro-forma 1120 annually regardless** (even at
  zero tax). **Missing Form 5472 penalty: $25,000.** Due April 15 (extendable to Oct 15).
- **Korea:** taxes worldwide income for residents; declare LLC profit as foreign business
  income; file 종합소득세 (comprehensive income tax), due May of the following year. US-Korea
  treaty prevents double taxation.
- **Sweden:** confirm tax residency properly severed with Skatteverket (Sweden is aggressive
  about unlimited tax liability if strong ties remain).

## Money flow & capital account
- **Owner distributions** (paying yourself): Mercury → Wise → Korean bank, memo "Owner
  Distribution"/"Member Draw"; taxable as income in Korea; NOT salary, no US payroll tax.
- **Capital contributions** (funding the LLC): Korean bank → Mercury, memo "Owner Capital
  Contribution"; not taxable; contributed capital can be withdrawn back out tax-free (profit
  withdrawals are taxable). Keep a capital-account log (contribute $1,000 → balance $1,000;
  withdraw $1,000 → $0, tax-free; withdraw profit → taxable in Korea).

## Deductions & documentation
- **Deductible:** SaaS tools/subscriptions/hosting, business travel (flights/hotels/transport),
  meals at 50% on business trips, conference tickets, accounting/legal fees, hardware (primarily
  business use). (This is what makes the [[pre-incorporation-expenses]]
  worth tracking now.)
- **Business travel:** primary purpose must be business (>50% of days), applies globally; write
  a dated "trip purpose" note before each trip; keep calendar invites, tickets, email threads.
- **Documentation habit:** photo every receipt immediately; Google Drive folder Year → Month;
  note amount, purpose, who you met.

## Tool stack
Wave (bookkeeping/P&L/invoicing, free); Mercury (banking + expense tracking, free); Wise
(transfers, per-transfer); Google Drive (receipts, free); expat CPA (Form 5472, $300-500/yr);
Korean accountant (종합소득세, KRW 200-400K/yr). QuickBooks not needed until employees/inventory.

## Incorporation checklist
Form LLC via Stripe Atlas → open Mercury + Wise → get EIN (Atlas handles) → track all expenses
from day one → hire expat CPA for Form 5472 → hire Korean accountant for 종합소득세 → confirm
Swedish tax residency severed → keep capital-account log.

## Related
- [[pre-incorporation-expenses]] — the June-2026 expenses to book as owner reimbursements once this LLC exists.
- [[leadodex]] — the likely first business under the entity.

## History
- 2026-06-29 — Page created by `sleep` from a user-provided guide (us-llc-guide.md, created
  2026-06-28). Reference snapshot; verify figures/rules at actual incorporation time.
