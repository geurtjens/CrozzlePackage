public class C3x6_MOMLMO_OMU {
   static func Execute(W: WordModelSOA, wordCount: Int) -> ClusterModel {
        let interlockWidth = 3
        let interlockHeight = 6
        let stride = interlockWidth + interlockHeight
        var index = 0 //pointer to where we should put next set of words
        var shapeCount = 0
        var outerStart: [UInt8] = []
        var wordId: [UInt8] = []

        for phase in 0..<2 {
            if phase == 1 {
                wordId = Array(repeating: 0, count: stride * shapeCount)
                outerStart = Array(repeating: 0, count: stride * shapeCount)
            }

            for outery1 in 0..<wordCount {

                if W.Len[outery1] >= interlockHeight + 2 {

                    let outery1Limit = Int(W.Len[outery1]) - Int(interlockHeight)
                    for outery1Pos in 1..<outery1Limit {

                        //print("outery1:\(W.Start[outery1])")

                        for middlex1 in 0..<wordCount {

                            if (W.Len[middlex1] == interlockWidth &&
                                W.Start[middlex1][0] == W.Start[outery1][outery1Pos + 0] &&
                                W.Id[middlex1] != W.Id[outery1]) {
                                //print("middlex1:\(W.Start[middlex1])")

                                for middley2 in 0..<wordCount {

                                    if (W.Len[middley2] == interlockHeight &&
                                        W.Start[middley2][0] == W.Start[middlex1][1] &&
                                        W.Id[middley2] != W.Id[middlex1] &&
                                        W.Id[middley2] != W.Id[outery1]) {
                                        //print("middley2:\(W.Start[middley2])")

                                        for outerx2 in 0..<wordCount {

                                            if W.Len[outerx2] >= interlockWidth + 2 {

                                                let outerx2Limit = Int(W.Len[outerx2]) - Int(interlockWidth)
                                                for outerx2Pos in 1..<outerx2Limit {

                                                    if (W.Start[outerx2][outerx2Pos + 0] == W.Start[outery1][outery1Pos + 1] &&
                                                    W.Start[outerx2][outerx2Pos + 1] == W.Start[middley2][1] &&
                                                    W.Id[outerx2] != W.Id[middley2] &&
                                                    W.Id[outerx2] != W.Id[middlex1] &&
                                                    W.Id[outerx2] != W.Id[outery1]) {
                                                        //print("outerx2:\(W.Start[outerx2])")

                                                        for up3 in 0..<wordCount {

                                                            if (W.Len[up3] >= interlockHeight &&
                                                                W.End[up3][5] == W.Start[middlex1][2] &&
                                                                W.End[up3][4] == W.Start[outerx2][outerx2Pos + 2] &&
                                                                W.Id[up3] != W.Id[outerx2] &&
                                                                W.Id[up3] != W.Id[middley2] &&
                                                                W.Id[up3] != W.Id[middlex1] &&
                                                                W.Id[up3] != W.Id[outery1]) {
                                                                //print("up3:\(W.Start[up3])")

                                                                for middlex3 in 0..<wordCount {

                                                                    if (W.Len[middlex3] == interlockWidth &&
                                                                        W.Start[middlex3][0] == W.Start[outery1][outery1Pos + 2] &&
                                                                        W.Start[middlex3][1] == W.Start[middley2][2] &&
                                                                        W.Start[middlex3][2] == W.End[up3][3] &&
                                                                        W.Id[middlex3] != W.Id[up3] &&
                                                                        W.Id[middlex3] != W.Id[outerx2] &&
                                                                        W.Id[middlex3] != W.Id[middley2] &&
                                                                        W.Id[middlex3] != W.Id[middlex1] &&
                                                                        W.Id[middlex3] != W.Id[outery1]) {
                                                                        //print("middlex3:\(W.Start[middlex3])")

                                                                        for left4 in 0..<wordCount {

                                                                            if (W.Len[left4] >= interlockWidth &&
                                                                                W.End[left4][2] == W.Start[outery1][outery1Pos + 3] &&
                                                                                W.End[left4][1] == W.Start[middley2][3] &&
                                                                                W.End[left4][0] == W.End[up3][2] &&
                                                                                W.Id[left4] != W.Id[middlex3] &&
                                                                                W.Id[left4] != W.Id[up3] &&
                                                                                W.Id[left4] != W.Id[outerx2] &&
                                                                                W.Id[left4] != W.Id[middley2] &&
                                                                                W.Id[left4] != W.Id[middlex1] &&
                                                                                W.Id[left4] != W.Id[outery1]) {
                                                                                //print("left4:\(W.Start[left4])")

                                                                                for middlex5 in 0..<wordCount {

                                                                                    if (W.Len[middlex5] == interlockWidth &&
                                                                                        W.Start[middlex5][0] == W.Start[outery1][outery1Pos + 4] &&
                                                                                        W.Start[middlex5][1] == W.Start[middley2][4] &&
                                                                                        W.Start[middlex5][2] == W.End[up3][1] &&
                                                                                        W.Id[middlex5] != W.Id[left4] &&
                                                                                        W.Id[middlex5] != W.Id[middlex3] &&
                                                                                        W.Id[middlex5] != W.Id[up3] &&
                                                                                        W.Id[middlex5] != W.Id[outerx2] &&
                                                                                        W.Id[middlex5] != W.Id[middley2] &&
                                                                                        W.Id[middlex5] != W.Id[middlex1] &&
                                                                                        W.Id[middlex5] != W.Id[outery1]) {
                                                                                        //print("middlex5:\(W.Start[middlex5])")

                                                                                        for outerx6 in 0..<wordCount {

                                                                                            if W.Len[outerx6] >= interlockWidth + 2 {

                                                                                                let outerx6Limit = Int(W.Len[outerx6]) - Int(interlockWidth)
                                                                                                for outerx6Pos in 1..<outerx6Limit {

                                                                                                    if (W.Start[outerx6][outerx6Pos + 0] == W.Start[outery1][outery1Pos + 5] &&
                                                                                                    W.Start[outerx6][outerx6Pos + 1] == W.Start[middley2][5] &&
                                                                                                    W.Start[outerx6][outerx6Pos + 2] == W.End[up3][0] &&
                                                                                                    W.Id[outerx6] != W.Id[middlex5] &&
                                                                                                    W.Id[outerx6] != W.Id[left4] &&
                                                                                                    W.Id[outerx6] != W.Id[middlex3] &&
                                                                                                    W.Id[outerx6] != W.Id[up3] &&
                                                                                                    W.Id[outerx6] != W.Id[outerx2] &&
                                                                                                    W.Id[outerx6] != W.Id[middley2] &&
                                                                                                    W.Id[outerx6] != W.Id[middlex1] &&
                                                                                                    W.Id[outerx6] != W.Id[outery1]) {
                                                                                                        //print("outerx6:\(W.Start[outerx6])")

                                                                                                        if phase == 0 {
                                                                                                            shapeCount += 1
                                                                                                        }
                                                                                                        else {
                                                                                                            outerStart[index + 1] = UInt8(outerx2Pos)

                                                                                                            outerStart[index + 5] = UInt8(outerx6Pos)

                                                                                                            outerStart[index + 6] = UInt8(outery1Pos)

                                                                                                            ClusterHelper.AddWords(index: &index, wordId: &wordId, wordsToAdd: [middlex1, outerx2, middlex3, left4, middlex5, outerx6, outery1, middley2, up3])
                                                                                                        }
                                                                                                    }
                                                                                                }
                                                                                            }
                                                                                        }
                                                                                    }
                                                                                }
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

        return ClusterModel(
            wordId: wordId,
            outerStart: outerStart,
            patternHorizontal: [.middle, .outer, .middle, .leading, .middle, .outer],
            patternVertical: [.outer, .middle, .leading],
            interlockWidth: interlockWidth,
            interlockHeight: interlockHeight,
            stride: stride,
            size: shapeCount)
    }
}