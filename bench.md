# Simple Benchmark

| tool       | real | user |  sys | rss   | rate      | ratio  | opt |
|:----------:|:----:|:----:|:----:|:-----:|:---------:|:------:|:---:|
| iwasm aot  |  9.6 | 0.48 |  4.5 | 10.3M | 6.8 GiB/s |  133%  | no  |
| wazero     |  9.8 | 0.71 |  4.5 |  7.4M | 6.7 GiB/s |  131%  | no  |
| iwasm      | 10.2 | 0.41 |  4.7 | 10.3M | 6.3 GiB/s |  124%  | no  |
| wasmedge   | 10.3 | 0.59 |  4.6 | 22.6M | 6.2 GiB/s |  122%  | no  |
| wasmi      | 14.1 | 3.90 |  5.0 |  7.9M | 4.5 GiB/s |   88%  | no  |
| wasmer     | 23.2 | 7.76 | 12.5 | 20.5M | 2.8 GiB/s |   55%  | no  |
| cat        | 12.6 | 0.79 |  6.9 |  1.4M | 5.1 GiB/s | (100%) | N/A |
| iwasm aot  |  9.6 | 0.48 |  4.5 | 10.3M | 6.8 GiB/s |  133%  | yes |
| wazero     |  9.8 | 0.69 |  4.5 |  7.4M | 6.7 GiB/s |  131%  | yes |
| iwasm      | 10.1 | 0.40 |  4.6 | 10.3M | 6.3 GiB/s |  124%  | yes |
| wasmedge   | 10.2 | 0.59 |  4.6 | 22.6M | 6.3 GiB/s |  124%  | yes |
| wasmi      | 14.0 | 3.66 |  5.1 |  7.8M | 4.6 GiB/s |   90%  | yes |
| wasmer     | 23.3 | 7.71 | 12.6 | 20.5M | 2.7 GiB/s |   53%  | yes |
