# 10 Pin Bowling Challenge 🏆

┌───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┐
│ 1 │ 4 │ 4 │ 5 │ 6 │ / │ 5 │ / │   │ * │ 0 │ 1 │ 7 │ / │ 6 │ / │   │ * │ 2 │ / │ 6 │
│   └───┤   └───┤   └───┤   └───┤   └───┤   └───┤   └───┤   └───┤   └───┤   └───┴───┤
│   5   │   14  │  29   │  49   │  60   │   61  │   77  │   97  │  117  │    133    │
└───────┴───────┴───────┴───────┴───────┴───────┴───────┴───────┴───────┴───────────┘

/ marks a Spare and * marks a Strike

This repo is for the coding challenge for TokyoRubyistMeetup: Parse
a 10-pin bowling scorecard.

- **Easy**: Sum total pins knocked down.
- **Challenge**: Full official score with strikes (X), spares (/), opens, and 10th-frame bonuses.

Work in groups, tackle it in an hour, then demo.

Branches:

- `easy`: Code skeleton and tests for total pins.
- `challenge`: Code skeleton and tests for full scoring.

## Quick Rules Refresher

- **Frames**: 10 total.
- **Open**: <10 pins over 2 rolls (e.g., "71" = 7+1=8).
- **Gutter Ball -**: 0 pins (e.g., "6-" = 6+0, also "-" = 0+0).
- **Spare /**: 10 pins over 2 rolls (e.g., "6/" = 6+4).
- **Strike X**: 10 on first roll ("X").
- **Score**: Pins + bonuses (next roll for spare, next two for strike).
- **10^th^ Frame**: Up to 3 rolls if strike/spare.

## Setup

1. **Clone the repo**:

   ```
   git clone https://github.com/mish-tan/TokyoPythonBowlingChallenge.git
   cd TokyoRubyistMeetupBowlingChallenge
   ```

2. **Install dependencies: Make sure you have Ruby installed, then run:**

   ```
   bundle install
   ```

## Running Tests

Switch to your branch (`git checkout easy` or `challenge`), implement, then:

   ```
   bundle exec rspec
   ```

## Notes

This repo was (very) heavily inspired by TokyoPython's code challenge meetup that you can find [here](https://github.com/ben05allen/TokyoPythonBowlingChallenge). Thanks Ben!!
