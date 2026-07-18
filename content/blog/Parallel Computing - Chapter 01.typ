#import "/content/blog.typ": *
#import "/src/3rd_party/mathyml/lib.typ" as mathyml
#import mathyml.prelude: *

#show: main.with(
  title: "Demystifying CPUs and GPUs: What You Need to Know",
  desc: "Parallel Computing - Chapter 01",
  show-outline: true,
  date: "Jun 2023",
  tags: ("cuda", "gpu")
)

= Introduction

It is possible that many people have heard the terms *CPU* and *GPU*, but not everyone understands what they actually do. In this post, I will provide a simple explanation of these two fundamental computing components before diving deeper into parallel programming.

= CPUs


== What is a CPU?

A *Central Processing Unit (CPU)* is the primary processor of a computer. It is often called the *brain* of the computer because it executes instructions, performs arithmetic and logical operations, and coordinates communication between different hardware components.

CPU performance is commonly measured by:

- Clock frequency
- Number of cores
- Cache hierarchy
- Instruction-level optimizations

Although modern CPUs contain multiple cores, they are mainly designed to deliver high performance on sequential tasks.

== CPU Development and Its Challenges

#figure(
  grid(
    columns: 2,
    gutter: 1em,

    image(
      "../../image/cpu.png",
      width: 100%
    ),

    image(
      "../../image/cpu2.png",
      width: 100%
    ),
  ),
  caption: [Historical trends of CPU frequency and transistor growth.]
)

The graphs show rapid improvements in processor performance over many years. However, around 2004–2005, CPU clock frequency stopped increasing significantly.

Why did this happen?

For this article, I will keep the explanation simple. If you are interested in the details, see the references at the end.

The two major limitations were:

- *Power Wall*
- *Memory Wall*

=== Power Wall

Increasing clock frequency requires more electrical power.

As processors run faster, they consume significantly more energy and generate much more heat. Eventually, simply increasing frequency became impractical because cooling systems and power consumption could no longer keep up.

=== Memory Wall

Even if the processor becomes much faster, it still has to wait for data from memory.

Since memory latency improves much more slowly than processor speed, many applications become limited by memory access instead of computation.

These two challenges motivated the transition from faster processors to *parallel processors*.

= GPUs


== What is a GPU?

A *Graphics Processing Unit (GPU)* is a specialized processor originally designed to accelerate graphics rendering.

Today, GPUs are widely used in:

- Artificial Intelligence
- Deep Learning
- Scientific Computing
- Physics Simulation
- High Performance Computing (HPC)

Their strength lies in executing thousands of operations simultaneously.

#figure(
  image("../../image/cpu-gpu.png", width: 80%),
  caption: [GPU performance growth over time.]
)

Compared with CPUs, GPUs can perform many more arithmetic operations per second because they contain thousands of lightweight processing cores.

== Parallel Processing

To understand parallel processing, consider the following example.

Suppose a teacher assigns ten questions to a class.

The simplest solution is to ask the best student to answer all ten questions.

However, imagine training ten equally capable students and assigning one question to each student. All ten questions could then be solved simultaneously, making the process much faster.

This is essentially how GPUs operate.

Instead of using a few powerful cores like a CPU, a GPU uses thousands of smaller cores to execute many tasks in parallel.

Of course, not every problem can be divided perfectly. Some tasks depend on previous results, while others cannot be executed simultaneously. Therefore, parallel computing is most effective for workloads that contain many independent operations.

== Parallel Computing

Parallel computing is the evolution of traditional sequential computing.

Instead of solving one task after another, a large computation is divided into many smaller subtasks that execute simultaneously on multiple processing units.

Common parallel computing models include:

- Shared-memory systems
- Distributed-memory systems
- Hybrid systems

Modern GPUs are designed specifically to exploit this type of computation.

= Conclusion

CPUs excel at sequential processing and complex control logic, while GPUs excel at massively parallel computation.

As CPU frequency scaling reached its physical limits due to the *Power Wall* and *Memory Wall*, the computing industry shifted toward multicore processors and GPU acceleration.

Understanding these architectural differences is the first step toward learning parallel programming.

In the next article, we will explore GPU programming using CUDA and examine how GPUs execute thousands of threads efficiently.

Thank you for reading!


